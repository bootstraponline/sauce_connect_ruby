module Stub
  module AngularPage
    class << self
      def goto; fail('stub called!'); end
      def download_button; fail('stub called!'); end
      def download_button_element; fail('stub called!'); end
      def download_button?; fail('stub called!'); end
    end
  end
end

public

def angular_page
  Stub::AngularPage
end
