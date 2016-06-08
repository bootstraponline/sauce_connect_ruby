# sauce rspec example

[![Dependency Status](https://gemnasium.com/bootstraponline/sauce_connect_ruby.svg?nocache)](https://gemnasium.com/bootstraponline/sauce_connect_ruby)
[![Build Status](https://travis-ci.org/bootstraponline/sauce_connect_ruby.svg?branch=master)](https://travis-ci.org/bootstraponline/sauce_connect_ruby/builds)

Run tests locally. Sauce ENV vars must be set to empty string or not defined.

```
export SAUCE_USERNAME=""
export SAUCE_ACCESS_KEY=""
bundle exec rspec
```

Run tests on sauce in parallel:

```
export TEST_QUEUE_SPLIT_GROUPS=true
export TEST_QUEUE_VERBOSE=true
export SAUCE_USERNAME="..."
export SAUCE_ACCESS_KEY="..."
bundle exec rspec-queue spec/
```

Run tests on sauce serially (sauce env vars must be defined):

`bundle exec rspec`

Update stubs:

```
rake stubs
```

### rspec-queue --format

```bash
export TEST_QUEUE_VERBOSE=true

# Prints JSON for all processes to stdout
rspec-queue --format json spec/

# Prints JSON for all processes to out.txt
rspec-queue --format json --out out.txt spec/

# Prints JUnit XML for all processes to stdout
rspec-queue --require rspec_junit --format JUnit spec/

# Prints JUnit XML for all processes to junit.xml
rspec-queue --require rspec_junit --format JUnit --out junit.xml spec/
```
