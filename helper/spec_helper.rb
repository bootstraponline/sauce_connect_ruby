require 'rubygems'
require 'angular_automation'

# Require stubs for RubyMine auto completion
require_relative 'stub/angular_page_stub'

WebDriverUtils.require_all_pages

require_relative 'sauce_helper'
require_relative 'trace_helper'
require_relative 'expect_helper'
require_relative 'spec_helpers'

spec_helpers = SpecHelpers.instance
at_exit { spec_helpers.driver_quit rescue nil }

RSpec.configure do |config|
  config.before(:each) do
    WebDriverUtils.define_page_methods page_module: Page, target_class: self, watir: browser
  end
end
