require_relative "boot"

require "rails/all"

Bundler.require(*Rails.groups)

module Cinemind
  class Application < Rails::Application
    config.load_defaults 7.1
    config.autoload_lib(ignore: %w(assets tasks))
    
    # Usar Sidekiq para jobs em background
    config.active_job.queue_adapter = :sidekiq
    
    # Locale padrão
    config.i18n.default_locale = :en
  end
end
