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
end
