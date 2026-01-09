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
$ gem install authentication:install
```

Follow the instructions post-installation.

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

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
