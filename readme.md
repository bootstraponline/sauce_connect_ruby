# sauce connect ruby

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

local run:

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
