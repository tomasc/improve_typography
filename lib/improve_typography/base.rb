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
      base_processors.each do |klass|
        self.str = processor_for_locale(klass).call(str)
      end

      str
    end

    private

    def processor_for_locale(klass)
      name = klass.to_s.split('::').last
      Object.const_get("ImproveTypography::Processors::#{locale.to_s.upcase}::#{name}")
    rescue NameError => e
      klass
    end

    def base_processors
      ObjectSpace.each_object(Class)
                 .select { |klass| klass < ImproveTypography::Processor }
                 .select { |klass| klass.to_s.split('::').length == 3 }
    end

    def locale
      options.fetch :locale, default_locale
    end

    def default_locale
      # TODO: infer from I18n.default_locale if exists?
      # TODO: make configurable?
      :en
    end
  end
end
