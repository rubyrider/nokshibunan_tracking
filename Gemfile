source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.1'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 6.0.0'
# Use mysql as the database for Active Record
gem 'mysql2', '>= 0.4.4'
# Use Puma as the app server
gem 'puma', '~> 3.11'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5'
# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem 'webpacker', '~> 4.0'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.7'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Active Storage variant
# gem 'image_processing', '~> 1.2'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.2', require: false

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'web-console', '>= 3.3.0'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'annotate'
  gem "capistrano", '3.10.0'
  gem 'capistrano-bundler', '1.6.0'
  gem 'capistrano-logtail', '0.1.1'
  gem 'capistrano-rails', '1.4.0'
  gem 'capistrano-rails-console', '2.3.0', require: false
  gem 'capistrano-rake', '0.2.0', require: false
  gem 'capistrano-rbenv', '2.1.4'
  gem 'capistrano-sidekiq', '1.0.3', github: 'seuros/capistrano-sidekiq'
  gem 'capistrano-yarn', '2.0.2'
  gem 'capistrano3-nginx', '2.1.6'
  gem 'capistrano3-puma', '3.1.1'
  gem 'rubocop', '~> 0.52.1', require: false
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

gem 'activeadmin', '2.2.0'
gem 'activeadmin_addons'
gem 'arctic_admin', '3.0.0'
gem 'carrierwave', '~> 2.0'
gem 'countries'
gem 'devise'
gem 'friendly_id', '~> 5.2.4'
gem "rolify"
gem 'sidekiq'
gem 'phony_rails'
gem 'rails-i18n', '~> 6.0.0'