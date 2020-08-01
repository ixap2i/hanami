source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
# gem 'rails', '5.1.1'
gem 'rails', '~> 5.1'

# Use sqlite3 as the database for Active Record
# gem 'sqlite3'
# Use Puma as the app sever
gem 'puma', '~> 3.7'
# Use SCSS for stylesheets
gem 'sass-rails', '5.0.6'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
gem 'therubyracer', platforms: :ruby

# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '2.7.0'
# Use Redis adapter to run Action Cable in production
gem 'redis', '~> 4.0'
# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '~> 2.13'
  gem 'selenium-webdriver'
end

# use mariaDB
gem 'mysql2', '~> 0.4.4'
# gem 'mysql'


group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring', '1.7.1'
  # gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'database_cleaner'
  gem 'rspec-rails'
  gem 'factory_girl_rails'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

gem "slim-rails", "3.1.3"
gem "chunky_png"
gem "html2slim"
gem "jquery-rails", "4.3.1"

# upload images
gem "refile", github: 'refile/refile', require: "refile/rails"
gem "refile-mini_magick", github: 'refile/refile-mini_magick'

# gem "actionpack", "5.1.1"
# gem "activemodel", "5.1.1"
# gem "activesupport", "5.1.1"


# gem "railties", "5.1.1"

# debug
gem "pry"
gem "pry-nav"

# rails c looks be good!
gem 'hirb'
gem 'hirb-unicode'

# .env
gem 'dotenv-rails'

gem 'execjs'
# for font-face
group :staging, :production, :development do
  gem 'rails_12factor'

gem "websocket-rails"
gem 'faye-websocket', '~>0.11.0'
end
