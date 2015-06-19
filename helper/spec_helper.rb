require 'rubygems'
require 'angular_automation'

WebDriverUtils.require_all_pages

# Require stubs for RubyMine auto completion
require_relative 'stub/angular_page_stub'

require_relative 'sauce_helper'
require_relative 'trace_helper'
require_relative 'expect_helper'
require_relative 'spec_helpers'

RSpec.configure do |config|

  # sauce gem injects selenium instance at the before each rspec level
  # we can't use a singleton driver since the driver is created/destroyed
  # for every test
  config.before(:each) do
    @spec_helpers = SpecHelpers.new(@selenium)
  end

  config.after(:each) do
    @spec_helpers.driver_quit
  end
end
