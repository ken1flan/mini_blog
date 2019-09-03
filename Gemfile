# frozen_string_literal: true

source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

gem 'pg', '~> 1.1', '>= 1.1.3'
gem 'puma', '~> 4.1'
gem 'rails', '~> 5.2.0'
gem 'sass-rails', '~> 6.0'
gem 'uglifier', '>= 1.3.0'

gem 'active_decorator'
gem 'bcrypt', '~> 3.1.7'
gem 'bootsnap'
gem 'coffee-rails', '~> 5.0'
gem 'jbuilder', '~> 2.5'
gem 'kaminari'
gem 'turbolinks', '~> 5'
gem 'webpacker', '~> 4.0'

gem 'faml'
gem 'haml-rails'
gem 'omniauth-google-oauth2'
gem 'rails-i18n', '~> 5.1', '>= 5.1.1'
gem 'redcarpet'
gem 'sitemap_generator'

gem 'sentry-raven'

group :development, :test do
  gem 'annotate'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'brakeman', require: false
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'capybara', '~> 3.29'
  gem 'dotenv-rails'
  gem 'factory_bot_rails'
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
  gem 'bullet', require: false
  gem 'pronto'
  gem 'pronto-brakeman', require: false
  gem 'pronto-eslint', require: false
  gem 'pronto-haml', require: false
  gem 'pronto-rails_best_practices', require: false
  gem 'pronto-reek', require: false
  gem 'pronto-rubocop', require: false
  gem 'pronto-scss', require: false
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end

ruby '2.6.3'
