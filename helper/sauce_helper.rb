# sauce gem requires this file directly so we need to require any
# used gems here even though spec_helper already requires them.
#
# sauce? and jenkins? methods
require 'webdriver_utils'
# Platform methods
require 'sauce_platforms'

Sauce.webdriver_method = lambda { |*args| ::Watir::Browser.new *args }

Sauce.config do |config|
  config.include AngularWebdriver::RSpecHelpers

  # Only tunnel if we're running locally on Sauce.
  # Sauce on Jenkins will use the Sauce OnDemand plugin to tunnel
  start_tunnel    = sauce? && !jenkins?
  sauce_connect_4 = File.expand_path('../sauce_connect/sc-4.3.8-osx/bin/sc', __FILE__)

  puts "tunnel? #{start_tunnel}"
  puts " sauce? #{sauce?}"

  config[:start_local_application]    = false
  config[:start_tunnel]               = start_tunnel
  config[:sauce_connect_4_executable] = sauce_connect_4

  # Set default screen res for all platforms
  # https://docs.saucelabs.com/reference/test-configuration/#specifying-the-screen-resolution
  config['screen-resolution']         = '1280x1024'

  # https://saucelabs.com/platforms/
  config[:browsers]                   = [
    Platform.windows_8.firefox.v37
    # Can override / add new caps
    # Platform.mac_10_10.safari.v8 + ['screen-resolution' => '1024x768']
  ]
end
