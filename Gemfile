# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.2.0'

gem 'rails', '~> 7.0.4'

gem 'bootsnap', require: false
gem 'cssbundling-rails'
gem 'jbuilder'
gem 'jsbundling-rails'
gem 'pg', '~> 1.1'
gem 'puma', '~> 5.0'
gem 'redis', '~> 4.0'
gem 'sprockets-rails'
gem 'stimulus-rails'
gem 'turbo-rails'
# gem 'nokogiri', '1.13.9'
gem 'devise'

group :development, :test do
  gem 'pry-meta'
  gem 'rspec-rails', '~> 4.0.0'
  gem 'capybara'
end

group :development do
  gem 'web-console', '>= 4.1.0'

  gem 'foreman', require: false
  gem 'rubocop', require: false
  gem 'rubocop-packaging', require: false
  gem 'rubocop-performance', require: false
  gem 'rubocop-rails', require: false
  gem 'rubocop-rspec', require: false
end

# Architectural
gem "rails_event_store", "~> 2.6.0"
gem 'infra', path: './infra'

# UI
gem "view_component"
