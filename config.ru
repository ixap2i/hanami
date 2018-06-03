# This file is used by Rack-based servers to start the application.

require_relative 'config/environment'

# Action Cable uses EventMachine which requires that all classes are loaded in advance
Rails.application.eager_load!
# require 'action_cable/process/logging'

run Rails.application
