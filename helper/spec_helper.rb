require 'rubygems'
require 'angular_automation'
require 'sauce_rspec'
require 'sauce_rspec/rspec'
require 'selenium/webdriver/remote/http/curb'

AngularWebdriver.require_all_pages

# Require stubs for RubyMine auto completion
require_relative 'stub/angular_page_stub'

require_relative 'sauce_helper'
require_relative 'trace_helper'
require_relative 'expect_helper'
require_relative 'spec_helpers'

RSpec.configure do |config|
  def example_caps
    example     = RSpec.current_example
    caps        = example.caps
    description = example.description
    browser     = caps[:browserName].capitalize
    version     = caps[:platformVersion] || caps[:version]
    platform    = caps[:platformName] || caps[:platform]

    # Set Sauce Labs job_name
    caps[:name] = [description, '-', browser, version, '-', platform].join ' '
    caps
  end

  config.before(:each) do
    http_client         = ::Selenium::WebDriver::Remote::Http::Curb.new
    http_client.timeout = 5 * 60 # seconds
    caps                = example_caps

    # Retry failed session initialization up to a max wait of 5 minutes.
    watir_browser       = wait(5 * 60) do
      ::Watir::Browser.new :remote,
                           url:                  SauceRSpec.config.url,
                           desired_capabilities: caps,
                           http_client:          http_client
    end

    http_client.timeout = 1.5 * 60 # seconds
    SauceRSpec.driver   = watir_browser.driver
    @spec_helpers       = SpecHelpers.new(watir_browser)
  end

  config.after(:each) do
    SauceRSpec.run_after_test_hooks
    @spec_helpers.driver_quit rescue nil
  end
end
