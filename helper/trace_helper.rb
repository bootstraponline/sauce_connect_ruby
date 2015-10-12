# -- Trace
if false
  require 'trace_files'

  gem_dir         = File.join(`rvm gemdir`.strip, 'gems') # "/Users/user/.rvm/gems/ruby-2.2.2/gems"
  # selenium_webdriver_gem = File.expand_path File.join(gem_dir, 'selenium-webdriver-2.45.0', 'lib', '**', '*.rb')
  # watir_webdriver_gem    = File.expand_path File.join(gem_dir, 'watir-webdriver-0.7.0', 'lib', '**', '*.rb')
  # page_object_gem        = File.expand_path File.join(gem_dir, 'page_object-1.1.3', 'lib', '**', '*.rb')
  sauce_rspec_gem = File.expand_path File.join(gem_dir, 'sauce_rspec-1.0.1', 'lib', '**', '*.rb')


  targets = []
  # targets += Dir.glob(File.join(__dir__, '../../lib/**/*.rb'))
  # targets += Dir.glob(File.join(__dir__, '../../spec/**/*.rb'))
  # targets += Dir.glob(selenium_webdriver_gem)
  # targets += Dir.glob(watir_webdriver_gem)
  # targets += Dir.glob(page_object_gem)
  targets += Dir.glob(sauce_rspec_gem)

  targets.map! { |t| File.expand_path t }
  puts "Tracing: #{targets}"

  TraceFiles.set trace: targets
end
