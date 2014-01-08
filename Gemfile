source 'https://rubygems.org'
ruby '2.0.0'

def darwin_only(require_as)
  RUBY_PLATFORM.include?('darwin') && require_as
end

def linux_only(require_as)
  RUBY_PLATFORM.include?('linux') && require_as
end


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.2'
gem 'foreman'
gem 'capistrano', '~> 2.15.5'
gem 'dalli'
gem 'exception_notification'

# Server
gem 'unicorn' #staging and production
gem 'thin', group: :development

# Use postgresql as the database for Active Record
gem 'pg'

# Templating
gem 'slim'
gem 'slim-rails', group: :development
#gem 'escape_utils' #faster rendering see https://github.com/blog/1475-escape-velocity

# Form helpers
gem 'simple_form', '~> 3.0.1'

# Date and time
gem 'chronic'

# Settings (password)
gem 'settingslogic'

# Javascript
gem 'turbolinks'
gem 'jquery-turbolinks'
gem 'jquery-rails'
# gem 'jbuilder', '~> 1.2'

# CSS
gem 'sass-rails','>= 4.0.1'
gem 'coffee-rails','>= 4.0.1'
gem 'uglifier', '>= 1.3.0'
gem 'foundation-rails', '~> 5.0.2.0'
# Use jquery as the JavaScript library
gem 'jquery-rails'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'

gem 'devise'
# gem 'zurb-foundation'
gem 'dragonfly', '~> 1.0.2'
gem 'slim'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

group :development do
  gem 'letter_opener'
  gem 'quiet_assets'
  gem 'better_errors'
  gem 'binding_of_caller'
  # gem 'xray-rails'   (might break js)
  # gem 'meta_request' (might break file upload)
  gem 'pry-rails'
  gem 'pry-debugger'
  gem 'rails-erd' #generates ERD model diagrams
  gem 'annotate'
end


group :test, :development do
  gem 'capybara'
  gem 'factory_girl'
  gem 'launchy'
  gem 'pry-rails'
  gem 'rspec-rails'
  gem 'launchy'
  gem 'shoulda'
  gem 'valid_attribute'
end


group :test do
  gem 'minitest-rails-capybara'
  gem 'database_cleaner'
  gem 'simplecov', require: false
  gem 'turn', require: false
  gem 'faker'
  gem 'mocha'
end



# Use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.1.2'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]
