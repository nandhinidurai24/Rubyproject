source 'https://rubygems.org'

#ruby '2.3.2'

# back-end
gem 'rails', '4.2.4'
# gem 'pg' # don't need persistence layer for now
gem 'rest-client'
gem 'gon'
gem 'thin'
gem 'phony_rails'
gem 'access-granted'
gem 'validate_url'
gem 'dotenv-rails' # used also in production
gem 'validates_timeliness', '~> 4.0'
gem 'fastimage'
gem 'whenever', require: false
gem 'le'
gem 'byebug' # for debugging in production
gem 'unicorn'

# front-end
gem 'therubyracer'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'jquery-rails'
gem 'bootstrap-sass', '~> 3.3.6'
gem 'simple_form'
gem 'will_paginate'
gem 'will_paginate-bootstrap'
gem 'breadcrumbs_on_rails'
gem 'draper'
gem 'momentjs-rails'
gem 'bootstrap3-datetimepicker-rails' # for time inputs
gem 'bootstrap-datepicker-rails' # for date inputs
gem 'bootstrap-tagsinput-rails' # tags inputs
gem 'selectize-rails'
gem 'maskedinput-rails'
gem 'handlebars_assets'
gem 'rails-assets-promise-polyfill', source: 'https://rails-assets.org'
gem 'remotipart', '~> 1.2'
gem 'intl-tel-input-rails'
gem 'rails-html-sanitizer'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'rspec-rails'
  gem 'libnotify', require: (/linux/ =~ RUBY_PLATFORM ? 'libnotify' : false)
  gem 'growl', require: (/darwin/ =~ RUBY_PLATFORM ? 'growl' : false)
  gem 'factory_girl_rails'
  gem 'faker'
end

group :test do
  gem 'capybara'
  gem 'capybara-screenshot'
  gem 'selenium-webdriver'
  gem 'chromedriver-helper'
  gem 'headless'
  gem 'rack_session_access'
  gem 'poltergeist'
  gem 'rspec-context-private'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'
  gem 'zeus'
  gem 'quiet_assets'
  gem 'rack-livereload'
  gem 'guard-livereload', '~> 2.4', require: false
  gem 'guard-zeus'
  gem 'webmock'
  gem 'rubocop', '~> 0.45.0'

  gem 'capistrano', '~> 3.4.1'
  gem 'capistrano-rails'
  # gem 'capistrano-passenger'
  gem 'capistrano-rvm'
  gem 'capistrano3-unicorn'
end

group :production, :staging do
  gem 'exception_notification'
  gem 'slack-notifier'
end
