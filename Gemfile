# frozen_string_literal: true

source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

gem 'pg'
gem 'puma', '~> 3.7'
gem 'rails', '~> 5.1.1'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'

gem 'active_decorator'
gem 'bcrypt', '~> 3.1.7'
gem 'coffee-rails', '~> 4.2'
gem 'jbuilder', '~> 2.5'
gem 'kaminari'
gem 'turbolinks', '~> 5'
gem 'webpacker', '~> 2.0'

gem 'faml'
gem 'haml-rails'
gem 'omniauth-google-oauth2'
gem 'rails-i18n', '~> 5.0.0'
gem 'redcarpet'

group :development, :test do
  gem 'brakeman', require: false
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'capybara', '~> 2.13'
  gem 'dotenv-rails'
  gem 'factory_girl_rails'
  gem 'foreman'
  gem 'pry-byebug'
  gem 'pry-rails'
  gem 'rails_best_practices', require: false
  gem 'rspec-rails'
  gem 'rspec_junit_formatter'
  gem 'rubocop', require: false
  gem 'selenium-webdriver'
end

group :development do
  gem 'annotate'
  gem 'bullet', require: false
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end

ruby '2.4.2'
