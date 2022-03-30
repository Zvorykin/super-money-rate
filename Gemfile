# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.3'

# Web
gem 'puma', '~> 4.3'
gem 'rails', '~> 5.2.3'
gem 'rails_param'

# Sidekiq
gem 'sidekiq'
gem 'sidekiq-scheduler'

# Database
gem 'sqlite3'

group :development do
  gem 'webpacker'

  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'

  gem 'rubocop', require: false
  gem 'rubocop-rails'
end

group :development, :test do
  gem 'action-cable-testing'
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'factory_bot_rails'
  gem 'rspec-rails', '~> 3.8'
  gem 'webmock'
end

group :test do
  gem 'database_cleaner'
  gem 'simplecov'
end
