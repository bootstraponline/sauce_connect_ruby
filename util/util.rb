def silence_gem_warnings
  # https://github.com/appium/ruby_console/blob/1049c515432212f164cfbabd413d6e3d82e4aada/lib/appium_console.rb#L5
  Gem::Specification.class_eval do
    def self.warn args
    end
  end
end

def require_all_pages
  Dir.glob(File.join(__dir__, '../page/**/*.rb')) { |file| require_relative file }
end

def define_page_methods opts={}
  page_module  = opts[:page_module] || raise('must set page_module')
  target_class = opts[:target_class] || raise('must set target_class')
  driver_object = opts[:driver] || raise('must set driver')
  page_module.constants.each do |page_class|
    # ButtonsPage => buttons_page
    # https://github.com/rails/rails/blob/daaa21bc7d20f2e4ff451637423a25ff2d5e75c7/activesupport/lib/active_support/inflector/methods.rb#L96
    page_name = page_class.to_s.gsub(/([a-z])([A-Z])/, '\1_\2').downcase
    target_class.send(:define_singleton_method, page_name) do
      page_module.const_get(page_class).new driver_object
    end
  end
end
