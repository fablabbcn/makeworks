source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby File.read(".ruby-version").strip

gem "activeadmin"
gem 'simple_form'
gem 'pg'

gem "aws-sdk-s3", require: false
gem "acts_as_list", "~> 1.0"
gem 'chartkick'
gem 'countries'
gem 'country_select'
gem "devise", "~> 4.7"
gem "devise_invitable", "~> 2"
gem "devise-i18n"
gem 'discard', '~> 1.2'
gem 'friendly_id', '~> 5.3.0' # 5.4.0 has a breaking change! https://github.com/norman/friendly_id/pull/787
gem 'geocoder'
gem 'groupdate'
gem 'image_processing'
gem 'invisible_captcha', '~> 2.1'
gem 'mailgun-ruby'
gem 'mini_magick'
gem 'omniauth-fablabs', github: 'academany/omniauth-fablabs'
gem 'omniauth-linkedin-oauth2'
gem 'omniauth-google-oauth2'
gem "sentry-rails"
gem "sentry-ruby"
gem "sprockets-rails"
gem "turbo-rails"

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 7.0'
# Use sqlite3 as the database for Active Record
#gem 'sqlite3', '~> 1.4'
# Use Puma as the app server
gem 'puma'
# Use SCSS for stylesheets
gem 'sass-rails', '>= 6'
# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem 'webpacker'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.7'
# Use Redis adapter to run Action Cable in production
gem 'redis', '~> 4.0'
# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Active Storage variant
# gem 'image_processing', '~> 1.2'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.2', require: false


gem "uri", "0.13.0"
gem "net-http"

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'dotenv-rails'
end

group :development do
  gem 'bullet'
  gem 'guard'
  gem 'guard-minitest'
  gem 'i18n-tasks'
  # gem 'i18n-debug'
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.5'
  gem 'rack-mini-profiler'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring', '~> 4.1'
  gem 'spring-watcher-listen'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 2.15'
  gem 'capybara-select-2'
  gem 'selenium-webdriver'
  # Easy installation and use of web drivers to run system tests with browsers
  #gem 'webdrivers'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

gem "faker", "~> 2.19"
