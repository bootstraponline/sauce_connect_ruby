# sauce connect ruby [![Build Status](https://travis-ci.org/bootstraponline/sauce_connect_ruby.svg?branch=master)](https://travis-ci.org/bootstraponline/sauce_connect_ruby)

Run tests locally (make sure sauce env vars are not defined):

`bundle exec rspec`

Run tests on sauce in parallel:

```
export SAUCE_USERNAME="..."
export SAUCE_ACCESS_KEY="..."
rake sauce:spec
```

Run tests on sauce serially (sauce env vars must be defined):

`bundle exec rspec`

Update stubs:

```
rake stubs
```

#### test output

local run without sauce:

```
$ bundle exec rspec
tunnel? false
 sauce? false

Sauce connect
  successfully loads angularjs.org once
  successfully loads angularjs.org twice

Finished in 15.11 seconds (files took 1.79 seconds to load)
2 examples, 0 failures
```

local run with sauce:

```
$ bundle exec rspec
tunnel? true
 sauce? true

Sauce connect
[Sauce Connect is connecting to Sauce Labs...]
  successfully loads angularjs.org once
  successfully loads angularjs.org twice

Finished in 1 minute 16.48 seconds (files took 1.7 seconds to load)
2 examples, 0 failures
```

local run with sauce in parallel:

```
$ bundle exec rake sauce:spec
tunnel? true
 sauce? true
1 processes for 1 specs, ~ 1 specs per process
tunnel? true
 sauce? true
Run options: include {:sauce=>true}

Randomized with seed 38760

Sauce connect
[Sauce Connect is connecting to Sauce Labs...]
  successfully loads angularjs.org twice
  successfully loads angularjs.org once

Finished in 1 minute 3.06 seconds (files took 1.53 seconds to load)
2 examples, 0 failures

Randomized with seed 38760


2 examples, 0 failures

Took 66 seconds (1:06)
```
