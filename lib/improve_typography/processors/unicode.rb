module ImproveTypography
  module Processors
    class Unicode < Processor

      def call
        self.str = replace_ms_word_line_separator
        str
      end

      private

      def replace_ms_word_line_separator
        str.gsub(/\u2028/, "\n")
      end
    end
  end
end
