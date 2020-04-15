require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Makeworks
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.

    config.generators do |g|
      g.stylesheets false
      g.helper false
    end

    config.app_generators.scaffold_controller = :scaffold_controller

    config.i18n.available_locales = [:en, :is]
    config.i18n.default_locale = :en
    config.i18n.fallbacks = [:en]

    if ENV['RAVEN_DSN_URL'].present?
      Raven.configure do |config|
        config.dsn = ENV['RAVEN_DSN_URL']
      end
    end
  end
end
