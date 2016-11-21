require 'bundler/setup'

require 'minitest'
require 'minitest/autorun'
require 'minitest/spec'

require 'improve_typography'

Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each { |f| require f }
