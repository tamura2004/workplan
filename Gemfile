source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


gem 'rails', '~> 5.1.0.beta1'
# gem 'sqlite3'
gem "pg"
gem 'puma', '~> 3.0'
gem "rack-cors"
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'

gem 'jquery-rails'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'


group :development, :test do
  gem 'byebug', platform: :mri
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.0.5'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

gem "slim-rails"
gem "less-rails"
gem "therubyracer"
gem "execjs"
gem "twitter-bootstrap-rails"
gem "simple_form"
gem "seed-fu"

group :development do
  gem "pry-rails"
  gem "gimei"
end

group :development, :test do
  gem "rspec-rails"
  gem "factory_girl_rails"
  gem "rails-controller-testing"
end

group :test do
  gem "faker"
  gem "capybara"
  gem "database_cleaner"
  gem "launchy"
  gem "selenium-webdriver"
  gem "simplecov"
  gem "rspec-request_describer"
end
