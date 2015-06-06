require 'rubygems'
require 'angular_automation'

WebDriverUtils.require_all_pages

require_relative 'sauce_helper'
require_relative 'trace_helper'
require_relative 'expect_helper'

# Require stubs for RubyMine auto completion
require_relative 'stub/angular_page_stub'

RSpec.configure do |config|
  def driver
    @driver
  end

  config.before(:each) do
    if sauce?
      @watir = @selenium.driver # sauce_helper sets the driver to Watir
    else # run locally
      @watir = Watir::Browser.new :firefox
    end

    @driver = @watir.driver
    @protractor = Protractor.new watir: @watir # driver is watir

    # Must call after Protractor.new and not before.
    # Enables use of element and by within rspec tests.
    AngularWebdriver.install_rspec_helpers

    # set script timeout for protractor client side javascript
    # https://github.com/angular/protractor/issues/117
    _60_seconds                           = 60
    driver.manage.timeouts.script_timeout = _60_seconds
    # some browsers are slow to load.
    # https://github.com/angular/protractor/blob/6ebc4c3f8b557a56e53e0a1622d1b44b59f5bc04/spec/ciSmokeConf.js#L73
    driver.manage.timeouts.page_load      = _60_seconds
    driver.manage.timeouts.implicit_wait  = 0

    # sometimes elements just don't exist even though the page has loaded
    # and wait for angular has succeeded. in these situations, use client wait.
    #
    # implicit wait shouldn't ever be used. client wait is a reliable replacement.
    driver.set_max_wait 10 # seconds

    # set window size
    driver.manage.window.resize_to 1024, 768

    # set script timeout (used by protractor script in angular_page_object)
    # https://github.com/angular/protractor/issues/117
    driver.manage.timeouts.script_timeout = 60 # seconds

    # Note that since we're using watir, the driver must be set to watir.
    WebDriverUtils.define_page_methods page_module: Page, target_class: self, driver: @watir
  end

  config.after(:each) { @watir.quit rescue nil }
end
