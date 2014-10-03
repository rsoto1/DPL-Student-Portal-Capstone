source 'https://rubygems.org'
ruby '2.1.2'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.1.5'
# Use postgresql as the database for Active Record
gem 'pg'
# Ruby on Rails stylesheet engine for Sass
gem 'sass-rails', '~> 4.0.3'
# Bootstrap Sass gem
gem 'bootstrap-sass'
# add browser vendor prefixes automatically.
gem 'autoprefixer-rails'
# font-awesome-rails provides the Font-Awesome web fonts and stylesheets as a Rails engine for use with the asset pipeline.
gem "font-awesome-rails"
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'
# Use jquery as the JavaScript library
gem 'jquery-rails'


# # Use jquery-UI library
# gem 'jquery-ui-rails'


# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# Use Devise for user authentication and registration
gem 'devise'

group :development, :test do
  # Better Errors replaces the standard Rails error page with a much better and more useful error page.
  gem 'better_errors'
  # RailsPanel is a Chrome extension for Rails development. Have all information about your Rails app requests in the browser - in the Developer Tools panel.
  gem 'rails_panel'
  # Supporting gem for Rails Panel (Google Chrome extension for Rails development).
  gem 'meta_request'
  gem 'pry-rails'
  gem 'pry-nav'
  gem 'rspec-rails'
  gem 'capybara'
  gem 'factory_girl_rails'

end

group :test do
  # Database Cleaner provides auto cleaning of test db after running tests
  gem 'database_cleaner'
  # Provides a nice set of should methods for use in specs
  gem 'shoulda-matchers'
  # Provides metrics for test coverage
  gem 'simplecov', require: false
end

group :production do
  # Added for asset precompilation and support for Heroku deployment
  gem 'rails_12factor'
end

group :doc do
end
