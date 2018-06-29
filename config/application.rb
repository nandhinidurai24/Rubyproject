def env_flag_set?(var_name)
  (ENV[var_name] =~ /^y|yes|true|t|1|on$/i) ? true : false
end

require File.expand_path('../boot', __FILE__)

require 'rails'
# Pick the frameworks you want:
require 'active_model/railtie'
require 'active_job/railtie'
# require 'active_record/railtie' # don't need persistence layer for now
require 'action_controller/railtie'
require 'action_mailer/railtie'
require 'action_view/railtie'
require 'sprockets/railtie'
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module GustitosMerchantApp
  class Application < Rails::Application
  	# Settings in config/environments/* take precedence over those specified here.
  	# Application configuration should go into files in config/initializers
  	# -- all .rb files in that directory are automatically loaded.

  	# Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
  	# Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
  	# config.time_zone = 'Central Time (US & Canada)'

  	# The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
  	# config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
  	# config.i18n.default_locale = :de
  	config.i18n.default_locale = :en
  	# TODO: should be deduced from timezone, but it needs a bit of hardcode,
  	# so we assume that in first version our admins/planners/merchant admins and Merchants will be located in Puerto Rico 
  	config.beginning_of_week = :sunday

  	# Do not swallow errors in after_commit/after_rollback callbacks.
  	# config.active_record.raise_in_transactional_callbacks = true # don't need persistence layer for now

    config.autoload_paths << Rails.root.join('lib')
    config.autoload_paths << Rails.root.join('app/decorators/concerns')

    config.x.gustitos_assets.host = ENV['GUSTITOS_ASSETS_HOST'] || warn("ENV['GUSTITOS_ASSETS_HOST'] is not set")
    config.x.gustitos_assets.port = (ENV['GUSTITOS_ASSETS_PORT'] || warn("ENV['GUSTITOS_ASSETS_PORT'] is not set")).to_i

  	if ENV['LOGENTRIES_TOKEN']
  	  config.logger = Le.new(ENV['LOGENTRIES_TOKEN'], debug: true, local: true)
    end
	end
end
