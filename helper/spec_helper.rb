require 'rubygems'
require 'angular_automation'

WebDriverUtils.require_all_pages

require_relative 'sauce_helper'

# Require stubs for RubyMine auto completion
require_relative 'stub/angular_page_stub'

RSpec.configure do |config|
  config.before(:each) do
    if sauce?
      @driver = @selenium.driver # sauce_helper sets the driver to Watir
    else # run locally
      @driver = Watir::Browser.new :firefox
    end

    WebDriverUtils.define_page_methods page_module: Page, target_class: self, driver: @driver
  end

  config.after(:each) { @driver.quit rescue nil }
end
