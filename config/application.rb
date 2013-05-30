require File.expand_path('../boot', __FILE__)

# Pick the frameworks you want:
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "sprockets/railtie"
# require "rails/test_unit/railtie"

# Assets should be precompiled for production (so we don't need the gems loaded then)
Bundler.require(*Rails.groups(assets: %w(development test)))

module LesYourtesDeLaRiviere
  class Application < Rails::Application
    if Rails.env == "production"
      config.middleware.use("Rack::GoogleAnalytics", :web_property_id => "UA-41332607-1")
    end
  end
end