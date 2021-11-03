module ImproveTypography
  class Processor < Struct.new(:str, :options)
    class << self
      def call(*args)
        new(*args).call
      end

      def inherited(klass)
        ImproveTypography::Base.add_processor_class(klass)
        super
      end
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
