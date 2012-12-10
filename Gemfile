source 'http://rubygems.org'

gem 'rails', '3.0.10'
gem "hobo", "= 1.3.0.RC2"
gem "acts_as_list", '~> 0.1.4'

group :development do
  gem 'ffi', '1.0.9'
  gem 'capistrano', '>= 1.0.0'
  gem "capistrano-ext", '~> 1.2.1', :require => "capistrano"
  gem "haml", '~> 3.1.3'
  # gem 'ruby-debug19', :require => 'ruby-debug'
  # ruby-debug has ruby version deps.
  # use 'binding.pry' instead of 'debugger'
  # see: http://pry.github.com/screencasts.html
  gem 'awesome_print', '~> 1.0.2'
  gem 'railroady', '~> 1.0.7'
end

group :test do
  gem 'selenium-webdriver', ">=2.26"
  gem 'cucumber-rails', '~> 1.3.0', :require => false
  gem "rspec-rails", ">= 2.5.0"
  gem 'database_cleaner', '~> 0.7.0'
  gem 'launchy', '~> 2.0.5'
end

group :test, :development do
  gem 'guard', '~> 1.5.4'
  gem 'guard-rspec', '~> 1.2.1'
  gem 'rb-fsevent', '~> 0.9.2'
  gem 'sqlite3', '~> 1.3.4'
  gem 'rubygems-bundler', '~> 1.1.0'
  gem 'pry', '~> 0.9.10'
  gem 'pry-doc', '~> 0.4.4'
  gem 'pry-stack_explorer', '~> 0.4.7'
  gem 'pry-nav', '~> 0.2.2'
end

group :production do
  # gem 'mysql'
  gem 'mysql2', '~> 0.2.7'
end
