require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Makeworks
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")

    config.generators do |g|
      g.stylesheets false
      g.helper false
    end

    config.app_generators.scaffold_controller = :scaffold_controller

    config.i18n.available_locales = [:en, :es, :fr, :is, :it]
    config.i18n.default_locale = :en
    config.i18n.fallbacks = [:en]
  end
end
