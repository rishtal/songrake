source 'http://rubygems.org'

gem 'rails', '3.1.10'

# Bundle edge Rails instead:
# gem 'rails',     :git => 'git://github.com/rails/rails.git'

gem 'devise'
gem 'simple_form'
gem 'thumbs_up'

gem 'bootstrap-sass', '~> 1.4.4'
gem 'will_paginate'
gem "bootstrap-will_paginate", "~> 0.0.3"

group :production, :staging do
  gem "pg"
end

group :development, :test do
  gem "sqlite3-ruby", "~> 1.3.0", :require => "sqlite3"
end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.1.5'
  gem 'coffee-rails', '~> 3.1.1'
  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'ruby-debug19', :require => 'ruby-debug'

gem 'factory_girl_rails', "~> 1.2"

group :test do
  # Pretty printed test output
  gem 'turn', '~> 0.8.3', :require => false
  gem 'ZenTest'
  gem 'autotest-rails-pure'
  gem 'minitest'
end
