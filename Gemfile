source "https://rubygems.org"

ruby "~> 3.2.0"

# Core
gem "rails", "~> 7.1.0"
gem "pg", "~> 1.5"
gem "puma", ">= 5.0"
gem "bootsnap", require: false

# Assets
gem "sprockets-rails"
gem "importmap-rails"
gem "turbo-rails"
gem "stimulus-rails"
gem "tailwindcss-rails"

# Authentication
gem "devise"

# Pagination
gem "pagy"

# Background Jobs
gem "sidekiq"
gem "redis"

# File Upload
gem "image_processing", "~> 1.2"

# API
gem "ruby-openai", "~> 8.3"

# Environment Variables
gem "dotenv-rails", "~> 3.1"

group :development, :test do
  gem "debug", platforms: %i[ mri windows ]
end

group :development do
  gem "web-console"
  gem "letter_opener"
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
end


gem "kaminari", "~> 1.2"
