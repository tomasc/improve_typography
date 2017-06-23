require 'i18n'

module ImproveTypography
  class Configuration
    attr_accessor :processors

    def initialize
      @processors = [
        Processors::WordLineSeparator,
        Processors::Ellipsis,
        Processors::EnDash,
        Processors::EmDash,
        Processors::MultiplySign,
        Processors::Nbsp,
        Processors::Numbers,
        Processors::SingleQuotes,
        Processors::DoubleQuotes,
        Processors::Apostrophe,
        Processors::Units
      ]
    end
  end
end
