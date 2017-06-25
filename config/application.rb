require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module YibuIo
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    config.assets.paths << '/node_modules'

    # config mailer
    config.action_mailer.default_url_options = Settings.mailer.default_url_options.to_h
    config.action_mailer.delivery_method = :smtp
    config.action_mailer.smtp_settings = Settings.mailer.smtp.to_h
  end
end
