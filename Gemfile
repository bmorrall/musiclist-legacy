source 'http://rubygems.org'

ruby '1.9.2'
gem 'rails', '3.2.13'

# Bundle edge Rails instead:
# gem 'rails',     :git => 'git://github.com/rails/rails.git'

gem 'pg'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'coffee-rails'
  gem 'uglifier'

  gem 'sass-rails'
  gem 'bootstrap-sass'
end

gem 'devise'

gem 'cancan'

gem 'jquery-rails'
gem 'jquery-rails-cdn'

gem "rails-backbone"

gem 'simple_form'

gem 'jbuilder'

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'ruby-debug19', :require => 'ruby-debug'

gem "rspec-rails", :group => [:test, :development]  
group :test do  
  gem "factory_girl_rails"  
  gem 'faker'
  gem "guard-rspec"
  gem "shoulda-matchers"
end  

group :test do
  # Pretty printed test output
  gem 'turn', :require => false
end
