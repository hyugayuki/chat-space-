require_relative 'boot'

require 'rails/all'
Bundler.require(*Rails.groups)

module ChatSpace
  class Application < Rails::Application
    config.generators do |g|
      g.helper false
      g.javascripts false
      g.test_framework false
    end
  end
end
