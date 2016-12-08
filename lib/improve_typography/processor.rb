module ImproveTypography
  class Processor < Struct.new(:str, :options)
    def self.call(*args)
      new(*args).call
    end

    def initialize(str, options = {})
      super(str, options)
    end

    def call
      str
    end

    private

    def configuration
      @configuration ||= Configuration.new
    end

    def locale
      options.fetch :locale, I18n.locale
    end
  end
end
