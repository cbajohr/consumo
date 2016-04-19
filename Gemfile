source 'https://rubygems.org'

ruby '2.1.5'

gem 'rails', '4.2.6'
gem 'devise'
gem 'paperclip'
gem 'therubyracer'
gem 'less-rails' #Sprockets (what Rails 3.1 uses for its asset pipeline) supports LESS
gem 'twitter-bootstrap-rails'

gem 'bootstrap_form'
gem 'rails_email_validator'
gem 'cancan'
gem 'haml-rails'
gem 'aws-sdk'
gem 'puma'

gem 'jquery-rails'
gem 'jquery-ui-rails'


# dafuq?
gem 'ransack'
gem 'polyamorous'
gem 'by_star'
gem 'morrisjs-rails'
gem 'raphael-rails'
# /dafuq?

gem 'will_paginate-bootstrap'


group :production do
  # HEROKU stuff
  gem 'rails_12factor'
  gem 'pg'
end

group :assets do
  gem 'sass-rails'
  gem 'coffee-rails'
  gem 'uglifier'
end

group :development do
  gem 'quiet_assets'
  gem 'letter_opener'
  gem 'rails-erd'
  gem 'binding_of_caller'
  gem 'better_errors'
  gem 'annotate'
  gem 'rubocop'
  gem 'capistrano-rails'
end

group :test do
  gem 'shoulda-matchers'
  gem 'poltergeist'
  gem 'capybara'
  gem 'capybara-screenshot'
  gem 'factory_girl_rails'
  gem 'database_cleaner'
  gem 'launchy'
end

group :development, :test do
  gem 'rspec-rails'
  gem 'pry-byebug'
  gem 'jazz_hands', github: 'nixme/jazz_hands', branch: 'bring-your-own-debugger'
end


