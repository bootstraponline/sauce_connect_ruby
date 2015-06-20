module Stub
  module LocalPage
    class << self
      def goto; fail('stub called!'); end
      def greet_button; fail('stub called!'); end
      def greet_button_element; fail('stub called!'); end
      def greet_button?; fail('stub called!'); end
      def greet_button2; fail('stub called!'); end
      def greet_button2_element; fail('stub called!'); end
      def greet_button2?; fail('stub called!'); end
    end
  end
end

module RSpec
  module Core
    class ExampleGroup
      def local_page
        Stub::LocalPage
      end
    end
  end
end
