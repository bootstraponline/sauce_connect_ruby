class SpecHelpers
  attr_reader :browser, :protractor, :driver

  def initialize sauce_driver=nil
    browser_name = :firefox # default

    # @browser = Watir::Browser.new browser_name

    # Chrome is required for the shadow dom test
    # Selenium::WebDriver::Chrome.driver_path = File.expand_path File.join(__dir__, '..', 'chromedriver')
    # @browser = Watir::Browser.new browser_name

    # Remote driver is useful for debugging

    if sauce_driver
      @browser = sauce_driver # sauce_driver is a Watir instance
    else
      begin
        @browser = Watir::Browser.new :remote, desired_capabilities: Selenium::WebDriver::Remote::Capabilities.send(browser_name)
      rescue # assume local browser if the remote doesn't connect
        # often the tests are running locally using a remote which fails on
        # travis since travis isn't setup for a remote browser.
        @browser = Watir::Browser.new browser_name
      end
    end

    raise 'Browser is nil' unless browser
    @driver = browser.driver
    raise 'Driver is nil!' unless driver

    driver.extend Selenium::WebDriver::DriverExtensions::HasTouchScreen
    driver.extend Selenium::WebDriver::DriverExtensions::HasLocation

    # set script timeout for protractor client side javascript
    # https://github.com/angular/protractor/issues/117
    _60_seconds                           = 60
    driver.manage.timeouts.script_timeout = _60_seconds
    # some browsers are slow to load.
    # https://github.com/angular/protractor/blob/6ebc4c3f8b557a56e53e0a1622d1b44b59f5bc04/spec/ciSmokeConf.js#L73
    #
    # Safari does not implement the page load timeout. Invoking it will cause
    # Unknown command: setTimeout
    driver.manage.timeouts.page_load      = _60_seconds unless driver.browser == :safari
    driver.manage.timeouts.implicit_wait  = 0

    # todo: this is a really cool stability technique that's not specific to angular.
    #
    # sometimes elements just don't exist even though the page has loaded
    # and wait for angular has succeeded. in these situations, use client wait.
    #
    # implicit wait shouldn't ever be used. client wait is a reliable replacement.
    # driver.set_max_wait 10 # seconds
    # driver.set_max_page_wait 30 # seconds

    # set window size
    driver.manage.window.resize_to 1024, 768
  end

  def driver_quit
    browser.quit rescue nil
  end
end
