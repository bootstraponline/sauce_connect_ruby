require 'bundler/setup'
require 'sauce'
require 'page_object_stubs'
require 'fileutils'

# rake sauce:spec[files,concurrency,test_options,parallel_options]      # Run specs in parallel on Sauce Labs

# ensure junit folder exists (used by sauce:spec parallel runs)
# junit folder is defined in .rspec_parallel
junit = 'junit'

# clean out old junit results
FileUtils.rm_rf junit
Dir.mkdir junit

# Generate the helper/stub/ files. Used to enable auto complete of the page
# objects in the specs.
#
# rake stubs
PageObjectStubs.add_stubs_task
