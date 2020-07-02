# Jungle

A mini e-commerce application built with Rails 4.2 for purposes of learning Rails through example. The basic functionality of the app was inherited, and the focus of this project was to expand features and fix bugs on the platform based on bug reports. 

Key priorities for the project included expanding functionality while following existing project conventions. The overarching goal was to get comfortable quickly picking up a new language and framework, and rapidly getting to a comfort implementing features. 

Following some functionality expansion, building out some automated testing specs on the existing codebase proved to be a good exercise in grasping that existing codebase more thorougly. 

Example bug fixes:
- Format item prices uniformly throughout the website
- Don't allow the user to access the checkout process with an empty cart.

Example features added:
- Secure user login
- Require authorization for admin dashboard access
- Testing with Rspec

## Project Images

### Main Store View
[Main store view!](https://github.com/Daniel-N-Huss/jungle-rails/blob/master/docs/Screen%20Shot%202020-07-01%20at%208.45.54%20PM.png?raw=true)

### Admin dashboard example
[Example of admin dashboard!](https://github.com/Daniel-N-Huss/jungle-rails/blob/master/docs/Screen%20Shot%202020-07-01%20at%209.03.08%20PM.png?raw=true)

### Order Reciept After Checkout

[Order receipt!](https://github.com/Daniel-N-Huss/jungle-rails/blob/master/docs/Screen%20Shot%202020-07-01%20at%209.03.53%20PM.png?raw=true)

## Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rake db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
8. Run `bin/rails s -b 0.0.0.0` to start the server

## Stripe Testing

Use Credit Card # 4242 4242 4242 4242 along with any future date and any 3 digit security pin for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

* Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
* PostgreSQL 9.x
* Stripe
