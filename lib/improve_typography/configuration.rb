module ImproveTypography
  class Configuration
    attr_accessor :default_locale

    attr_accessor :multiply_sign
    attr_accessor :em_dash_sign
    attr_accessor :en_dash_sign

    attr_accessor :processors

    def initialize
      # TODO: infer from I18n.default_locale if available?
      @default_locale = :en

      @multiply_sign = ' × '
      @em_dash_sign = '—'
      @en_dash_sign = ' – '
    end

    def processors
      @processors ||= ObjectSpace.each_object(Class)
                                 .select { |klass| klass < ImproveTypography::Processor }
                                 .select { |klass| klass.to_s.split('::').length == 3 }
    end
  end
end
