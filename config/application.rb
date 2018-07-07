require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Hanami
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    config.generators.template_engine = :slim 

    Bundler.require(*Rails.groups)

    Dotenv::Railtie.load

    # Do not generate asset files
    config.generators do |g|
      g.assets false
      g.test_framework :rspec,
        # モデル作成時にfixture(DB用のテストデータを一定に保つ仕組み)の作成を有効化
        fixtures: true,
        view_specs: false,
        routing_specs: false,
        controller_specs: false,
        request_specs: true
      # fixtureの代わりにfactory_girlを使うようにする
      g.fixture_replacement :factory_girl, dis: 'spec/factories'
    end
  end
end
