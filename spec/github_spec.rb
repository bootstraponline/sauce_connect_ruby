require_relative 'spec_helper'

describe 'Sauce connect' do
  it 'successfully loads github once', sauce: sauce? do
    github_page.goto
  end

  it 'successfully loads github twice', sauce: sauce? do
     github_page.goto
  end
end
