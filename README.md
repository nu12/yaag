# Yet Another Authentication Gem

Yet Another Authentication Gem (YAAG) provides passwordless authentication for your rails app, all it takes is the user's e-mail address. 

No password. No e-mail confirmation. No registration.

## TL;DR

```
bundle add yaag
bundle install

rails g authentication:install
rails db:migrate
```

## How it works

It's the same mechanics of password reset in traditional authentication: the user provides an e-amil address and receives a link with a token to sign in. At its core, it implements the same logic of the built-in rails authentication (in fact most of the gem's code came from the rails library).

## Installation
Add this line to your application's Gemfile:

```bash
bundle add yaag
```

And then execute:
```bash
bundle
```

Generate the authentication components (migrations, etc):
```bash
rails g authentication:install
```

Follow the on-screen post-installation instructions.

## Usage

By default, all controllers require signing in via the inclusion of `include Authentication` in the `ApplicationController`. If you have a route that doesn't require signing in, add `allow_unauthenticated_access` to it:

```
class GuestController < ApplicationController
  allow_unauthenticated_access only: %i[ index ]
  ...
end
```

Get the current user with `Current.user` and the current session with `Current.session`

```
class MyController < ApplicationController
  def something
    user = Current.user
    session = Current.session
    ...
  end 
end
```

### Generators

Here is a list of generator available in case any of the components of the gem need to be customized to specific application needs.

For views:

```bash
rails g authentication:copy:views
```

For controllers (including concerns):

```bash
rails g authentication:copy:controllers
```

For channels (application_cable/connection.rb):

```bash
rails g authentication:copy:channels
```

For mailers:

```bash
rails g authentication:copy:mailers
```

For models:

```bash
rails g authentication:copy:models
```

Note: some generators may copy several files into the application folder, it's safe to delete the ones that don't require modification.

### Test helper

To be able to perform tasks as an authenticated user, a helper is available to be used in tests. Add `include Yaag::Test::SessionsHelper` to your test class to access the methods `sign_in_as` and `sign_out`:

```
class MyControllerTest < ActionDispatch::IntegrationTest
  include Yaag::Test::SessionsHelper
  setup { sign_in_as(User.take) }
  ...
end
```

Note: the example above requires users fixtures to exist, which are not provided by this gem.

## Release

```bash
git tag $(bundle exec rake version | tr -d '"') && git push --tags
```

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
