require 'bundler/setup'
require 'sauce'
require 'page_object_stubs'

# rake sauce:spec[files,concurrency,test_options,parallel_options]      # Run specs in parallel on Sauce Labs

# ensure junit folder exists (used by sauce:spec parallel runs)
# junit folder is defined in .rspec_parallel
junit = 'junit'
Dir.mkdir junit unless Dir.exist?(junit)

# rake stubs
PageObjectStubs.add_stubs_task
