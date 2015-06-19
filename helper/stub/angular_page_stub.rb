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

module RSpec
  module Core
    class ExampleGroup
      def angular_page
        Stub::AngularPage
      end
    end
  end
end
