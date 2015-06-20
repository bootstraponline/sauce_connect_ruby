require_relative '../helper/spec_helper'

describe 'Sauce connect' do
  it 'successfully loads angularjs.org once', sauce: sauce? do
    angular_page.goto
    expect_true angular_page.download_button.include?('Download')
  end

  it 'successfully loads angularjs.org twice', sauce: sauce? do
    angular_page.goto
    expect_true angular_page.download_button.include?('Download')
  end

  it 'finds by custom protractor locator' do
    skip 'requires protractor test app to be running on localhost'
    local_page.goto
    element(by.binding('greet')).present? # protractor locator can be used directly
    local_page.greet_button?              # or inside a page object
  end
end
