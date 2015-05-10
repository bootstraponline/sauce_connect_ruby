require_relative '../helper/spec_helper'

describe 'Sauce connect' do
  it 'successfully loads angularjs.org once', sauce: sauce? do
    angular_page.visit
  end

  it 'successfully loads angularjs.org twice', sauce: sauce? do
    angular_page.visit
  end
end
