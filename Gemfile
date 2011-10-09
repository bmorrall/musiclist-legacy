source 'http://rubygems.org'

gem 'rails', '3.1.0'

# Bundle edge Rails instead:
# gem 'rails',     :git => 'git://github.com/rails/rails.git'

gem 'sqlite3'
gem 'pg'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'coffee-rails', "~> 3.1.0"
  gem 'uglifier'
end
# http://www.davidlowry.co.uk/400/activeadmin-on-heroku-rails-3-1/
gem 'sass-rails', "  ~> 3.1.0"

gem 'jquery-rails'

gem 'formtastic'

# Use ActiveAdmin for Admin tasks
gem 'activeadmin'
gem "meta_search",    '>= 1.1.0.pre'

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'ruby-debug19', :require => 'ruby-debug'

gem "rspec-rails", :group => [:test, :development]  
group :test do  
  gem "factory_girl_rails"  
  gem "capybara"  
  gem "guard-rspec"  
end  

group :test do
  # Pretty printed test output
  gem 'turn', :require => false
end
