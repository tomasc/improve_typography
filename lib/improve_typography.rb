require 'improve_typography/base'
require 'improve_typography/configuration'
require 'improve_typography/processor'

Dir["#{File.dirname(__FILE__)}/improve_typography/processors/**/*.rb"].each { |f| require f }

require 'improve_typography/version'
