require 'sauce'

def sauce_user
  ENV['SAUCE_USERNAME']
end

def sauce_key
  ENV['SAUCE_ACCESS_KEY']
end

def sauce?
  (!!sauce_user) && (!!sauce_key)
end

Sauce.config do |config|
  config[:start_tunnel]               = sauce?
  config[:sauce_connect_4_executable] = File.expand_path('../../sc-4.3.8-osx/bin/sc', __FILE__)
  config[:browsers]                   = [
    ['Windows 8', 'Firefox', 37]
  ]
end
