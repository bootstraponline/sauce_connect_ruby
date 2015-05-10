require_relative 'util/util'

require 'rubygems'

silence_gem_warnings

require 'angular_automation'

require_all_pages

require_relative 'sauce_helper'
require_relative 'stub/angular_page_stub'

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
