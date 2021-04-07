# Jungle

A mini e-commerce application built with Rails 4.2. Inherited from an existing codebase, Jungle served to learn how to navigate existing code-bases and implement new features with a new-to-me language, simulating a real world situation.

Implemented the following features for Jungle:

* **Sold Out Badge**: When a product is sold out, a styled Sold Out batch will be shown to the user.
* **Admin Categories**: Created restful routes to be able to create new categories within the admin namespace.
* **User Authentication**: User is able to sign up and login to Jungle. Their password is encrypted, and email address is validated for uniqueness to ensure a non duplicative user-base.
* **Enhanced Order Page**: Upon successful payment, a detailed order review page is shown to the user.

## Stack
* Rails
* Ruby
* RSpec 
* Poltergeist/Capybara
* ERB
* Boostrap

## Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rake db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
8. Run `bin/rails s -b 0.0.0.0` to start the server

## Additional Steps for Apple M1 Machines

1. Make sure that you are runnning Ruby 2.6.6 (`ruby -v`)
1. Install ImageMagick `brew install imagemagick imagemagick@6 --build-from-source`
2. Remove Gemfile.lock
3. Replace Gemfile with version provided [here](https://gist.githubusercontent.com/FrancisBourgouin/831795ae12c4704687a0c2496d91a727/raw/ce8e2104f725f43e56650d404169c7b11c33a5c5/Gemfile)


## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

* Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
* PostgreSQL 9.x
* Stripe