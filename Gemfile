source 'https://rubygems.org'

# for mongodb
# gem 'rails3-generators'
require 'rubygems'
require 'mongo'

gem 'rails', '3.2.9'
gem 'bootstrap-sass', '2.1'
gem "mongo_mapper"

# omniauth plugin
gem 'omniauth'
gem 'omniauth-facebook'

# delayed_job
gem 'delayed_job'
gem 'delayed_job_mongo_mapper', git: 'git://github.com/thisduck/delayed_job_mongo_mapper.git'
gem 'daemons'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'
group :development do
    gem 'sqlite3', '1.3.5'
end


gem 'json'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.5'
  gem 'coffee-rails', '~> 3.2.2'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.2.3'
end

group :test do
  gem "rspec"
  gem "rspec-rails"
  gem 'turn', :require => false
end

gem 'jquery-rails'

# for heroku
#group :production do
#    gem 'pg', '0.12.2'
#end

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'ruby-debug'
