require 'rubygems'
require 'angular_automation'

WebDriverUtils.require_all_pages

# Require stubs for RubyMine auto completion
require_relative 'stub/angular_page_stub'

require_relative 'sauce_helper'
require_relative 'trace_helper'
require_relative 'expect_helper'
require_relative 'spec_helpers'

spec_helpers = SpecHelpers.instance

# override stub methods
WebDriverUtils.define_page_methods page_module: ::Page,
                                   target_class: TOPLEVEL_BINDING.eval('self'),
                                   method: :define_method,
                                   watir: spec_helpers.browser

at_exit { spec_helpers.driver_quit rescue nil }
