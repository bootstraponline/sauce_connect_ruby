require_relative 'util/util'

require 'rubygems'

silence_gem_warnings

require 'yarjuf' # rspec_junit
require 'sauce' # sauce_ruby

require 'watir-webdriver'
require 'page-object'

require_all_pages

require 'rspec'
require 'pry' # for debugging

require_relative 'sauce_helper'

require_relative 'stub/github_page_stub'

RSpec.configure do |config|
  config.before(:each) do

    if sauce?
      # binding.pry
      @driver = @selenium.driver
    else # run locally
      @driver = Watir::Browser.new :firefox
    end

    define_page_methods page_module: Page, target_class: self, driver: @driver
  end

  config.after(:each) { @driver.quit rescue nil }
end
