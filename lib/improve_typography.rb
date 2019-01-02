require 'i18n'
require 'i18n/backend/fallbacks'

require 'improve_typography/base'
require 'improve_typography/configuration'
require 'improve_typography/processor'

Dir["#{File.dirname(__FILE__)}/improve_typography/processors/**/*.rb"].each { |f| require f }

I18n::Backend::Simple.send(:include, I18n::Backend::Fallbacks)
I18n.load_path += Dir.glob(File.join(File.dirname(__FILE__), 'config', 'locales', '*.yml'))

require 'improve_typography/version'

module ImproveTypography
  class << self
    attr_accessor :configuration
  end

  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.configuration=(config)
    @configuration = config
  end

  def self.configure
    yield configuration
  end
end
