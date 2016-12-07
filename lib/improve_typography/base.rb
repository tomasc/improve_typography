module ImproveTypography
  class Base < Struct.new(:str, :options)
    # REGEXP = /\./i

    def self.call(*args)
      new(*args).call
    end

    def initialize(str, options = {})
      super(str, options)
    end

    def call
      configuration.processors.each do |klass|
        self.str = processor_for_locale(klass).call(str)
      end

      str
    end

    private

    def configuration
      @configuration ||= Configuration.new
    end

    def processor_for_locale(klass)
      name = klass.to_s.split('::').last
      Object.const_get("ImproveTypography::Processors::#{locale.to_s.upcase}::#{name}")
    rescue NameError => e
      klass
    end

    def locale
      options.fetch :locale, configuration.default_locale
    end
  end
end
