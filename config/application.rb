require_relative 'boot'

require 'rails/all'
Bundler.require(*Rails.groups)

module ChatSpace
  class Application < Rails::Application
    config.i18n.default_locale = :ja
    config.autoload_paths += Dir[Rails.root.join('app', 'uploaders')]
    config.time_zone = 'Asia/Tokyo'
    config.generators do |g|
      g.helper false
      g.javascripts false
      g.test_framework false
    end
  end
end
