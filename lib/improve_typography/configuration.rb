require 'i18n'

module ImproveTypography
  class Configuration
    attr_accessor :default_locale

    attr_accessor :apostrophe_sign
    attr_accessor :multiply_sign
    attr_accessor :em_dash_sign
    attr_accessor :en_dash_sign

    attr_accessor :processors

    def initialize
      @default_locale = I18n.default_locale

      @apostrophe_sign = 'ʼ'
      @multiply_sign = ' × '
      @em_dash_sign = '—'
      @en_dash_sign = ' – '

      @processors = [
        Processors::Ellipsis,
        Processors::EnDash,
        Processors::EmDash,
        Processors::MultiplySign,
        Processors::Numbers,
        Processors::Quotes,
        Processors::Units
      ]
    end
  end
end
