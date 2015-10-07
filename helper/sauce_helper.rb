require 'sauce_platforms'

SauceRSpec.config do |config|
  config.caps = [
    Platform.windows_10.firefox.v41,
    Platform.windows_10.chrome.v45
  ]

  config.default_caps({ build: "sauce_rspec-#{SecureRandom.random_number(999_999)}"})
end
