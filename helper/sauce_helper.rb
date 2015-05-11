# sauce gem requires this file directly so we need
# the sauce? and jenkins? methods to be available
require 'webdriver_utils'

Sauce.webdriver_method = lambda { |*args| ::Watir::Browser.new *args }

Sauce.config do |config|
  # Only tunnel if we're running locally on Sauce.
  # Sauce on Jenkins will use the Sauce OnDemand plugin to tunnel
  start_tunnel    = sauce? && !jenkins?
  sauce_connect_4 = File.expand_path('../sauce_connect/sc-4.3.8-osx/bin/sc', __FILE__)

  puts "tunnel? #{start_tunnel}"
  puts " sauce? #{sauce?}"

  config[:start_local_application]    = false
  config[:start_tunnel]               = start_tunnel
  config[:sauce_connect_4_executable] = sauce_connect_4

  # https://saucelabs.com/platforms/
  config[:browsers]                   = [
    ['Windows 8', 'Firefox', 37]
  ]
end
