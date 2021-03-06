require_relative 'boot'

require 'rails/all'

ENV['RAILS_ADMIN_THEME'] = 'rollincode'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Sales
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1

    # Check if we use Docker to allow docker ip through web-console
    if ENV['DOCKERIZED'] == 'true'
      config.web_console.whitelisted_ips = '172.21.0.1'
    end

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
  end
end
