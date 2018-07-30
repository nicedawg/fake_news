source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.4.3'

# Core gems
gem 'puma', '~> 3.11'
gem 'rails', '~> 5.2.0'
gem 'sqlite3'

# Asset-related gems
gem 'bootstrap', '~> 4.1.3'
gem 'coffee-rails', '~> 4.2'
gem 'jbuilder', '~> 2.5'
gem 'jquery-rails'
gem 'sass-rails', '~> 5.0'
gem 'turbolinks', '~> 5'
gem 'uglifier', '>= 1.3.0'

# Other gems
gem 'bootsnap', '>= 1.1.0', require: false
gem 'httparty'
gem 'marky_markov'
gem 'nested_scaffold'
gem 'sanitize'
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'dotenv-rails'
  gem 'rspec-rails', '~> 3.7'
end

group :development do
  gem 'guard-rspec', require: false
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end

group :test do
  gem 'capybara', '>= 2.15', '< 4.0'
  gem 'capybara-screenshot'
  gem 'chromedriver-helper'
  gem 'selenium-webdriver'
  gem 'webmock'
end
