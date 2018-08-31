module ImproveTypography
  module Processors
    class WordLineSeparator < Processor
      REGEXP = /\u2028/

      def call
        return str unless str.match?(REGEXP)
        str.gsub(REGEXP, "\n")
      end
    end
  end
end
