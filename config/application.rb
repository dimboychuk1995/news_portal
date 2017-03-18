require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module NewsPortal
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    config.assets.paths << Rails.root.join('app', 'assets', 'fonts')

    config.generators do |g|
      g.test_framework nil
      g.stylesheets = false
      g.javascripts = false
      g.helper = false
    end
    config.time_zone = 'Europe/Kiev'
    config.i18n.default_locale = :uk
  end
end
