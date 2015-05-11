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
