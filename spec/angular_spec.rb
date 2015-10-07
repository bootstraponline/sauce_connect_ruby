require_relative '../helper/spec_helper'

describe 'Sauce' do
  it 'successfully loads angularjs.org once' do
    angular_page.goto
    expect_true angular_page.download_button.include?('Download')
  end

  it 'successfully loads angularjs.org twice' do
    angular_page.goto
    expect_true angular_page.download_button.include?('Download')
  end
end
