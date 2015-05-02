require_relative '../util/util'

require 'rubygems'

silence_gem_warnings

require 'watir-webdriver'
require 'page-object'

require_all_pages

require 'rspec'
require 'pry' # for debugging

require_relative 'sauce_helper'

RSpec.configure do |config|
  config.before(:each) do

    if sauce?
      @driver = Watir::Browser.new :remote,
                                   url: "http://#{sauce_user}:#{sauce_key}@ondemand.saucelabs.com:80/wd/hub"
    else # run locally
      @driver = Watir::Browser.new :firefox
    end


    define_page_methods page_module: Page, target_class: self
  end

  config.after(:each) { @driver.quit rescue nil }
end
