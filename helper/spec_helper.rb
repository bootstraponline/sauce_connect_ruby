require 'rubygems'
require 'angular_automation'

WebDriverUtils.require_all_pages

require_relative 'sauce_helper'

# Require stubs for RubyMine auto completion
require_relative 'stub/angular_page_stub'

def travis?
  ENV['TRAVIS_BUILD_ID']
end

RSpec.configure do |config|
  config.before(:each) do
    if sauce?
      @driver = @selenium.driver # sauce_helper sets the driver to Watir
    elsif travis?
      @driver = Watir::Browser.new :remote, desired_capabilities: Selenium::WebDriver::Remote::Capabilities.firefox
    else # run locally
      @driver = Watir::Browser.new :firefox
    end

    # set window size
    @driver.driver.manage.window.resize_to 1024, 768

    # set script timeout (used by protractor script in angular_page_object)
    # https://github.com/angular/protractor/issues/117
    @driver.driver.manage.timeouts.script_timeout = 60 # seconds

    WebDriverUtils.define_page_methods page_module: Page, target_class: self, driver: @driver
  end

  config.after(:each) { @driver.quit rescue nil }
end
