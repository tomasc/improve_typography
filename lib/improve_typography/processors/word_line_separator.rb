module ImproveTypography
  module Processors
    class WordLineSeparator < Processor
      REGEXP = /\u2028/

      def call
        str.gsub(REGEXP, "\n")
      end
    end
  end
end
