# Rakuten F2E Assignment

Our F2E system allows client to insert, modify and delete data.

## Web Tech Stack

* Frontend - Vue
* Backend - Ruby on Rails

## Developer Setup

1. Install Ruby 2.5.5
2. Install Bundler to manager dependencies: `gem install bundler`
3. Setup the database: `bundle exec rake db:migrate`
4. Start the application: `bundle exec rails s` or `foreman start`

## Gems

1. bootstrap - for views
2. bootstrap-glyphicons - for icon button
3. jquery-rails - for dynamic Web page
4. foreman - for setting configs quickly

## Validations

1. Fields serial number, name, phone, email are required.
2. name: unique
3. name: Any
4. phone: Digit and character + , - only.
5. email: Email format

## How to use

1. As a client, I can insert an user with name, phone and email(Create).
2. As a client, I can read all users from database(Read).
3. As a client, I can update the data of user(Update).
4. As a client, I can delete the user(Delete).

