module ImproveTypography
  class Base < Struct.new(:str, :options)
    def self.call(*args)
      new(*args).call
    end

    def initialize(str, options = {})
      super(str, options)
    end

    def call
      # split into sentences and loop over them
    end

    private

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
