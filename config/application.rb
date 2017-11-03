require_relative 'boot'

require "rails/all"
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "action_cable/engine"
require "sprockets/railtie"
Bundler.require(*Rails.groups)

module Cetchup
  class Application < Rails::Application
    config.encoding = "utf-8"
    config.filter_parameters += [:password]
    config.active_support.escape_html_entities_in_json = true
    config.active_record.whitelist_attributes = true

    config.assets.enabled = true
    config.assets.initialize_on_precompile = false

    config.assets.version = '1.0'
    config.ember.module_prefix = nil
    config.handlebars.templates_root = "ember/templates"
  end
end
