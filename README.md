Plymouth Software - Core
====================================

## Simple Core Functionality for Rails Apps

## Installation

1. In your `Gemfile`

    gem 'plymouthsoftware-core', :git => 'git://github.com/plymouthsoftware/core.git''

2. Install with Bundler:

    $ bundle install

## Usage

### ActiveRecord Users

1. Create a User model:

        $ rails generate model user first_name:string last_name:string email:string password_hash:string password_digest:string verified:boolean active:boolean verification_token:string

        $ rake db:migrate

2. In your model:

        class User < ActiveRecord::Base
          is_user
        end

#### Creating users

    u = User.new
    u.name = "Joe Bloggs"
    u.email = "joe@example.com"
    u.password = "secret"
    u.active = true

    u.save

    u.first_name 
    # => "Joe"
    u.last_name 
    # => "Joe"
    u.active?
    # => true
    u.verified?
    # => false

#### Verify the user (e.g. verification from confirmation email)
    u.verify!
    # => true (verification_token is nil by default)

    User.verified.active
    # => [<User: (Joe Bloggs)>, ...]

#### Authenticating a user account

    User.authenticate_with_email_and_password("joe@example.com", "oops")
    # => nil

    User.authenticate_with_email_and_password("joe@example.com", "secret")
    # => <User: (Joe Bloggs)>
