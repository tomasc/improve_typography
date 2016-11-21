module ImproveTypography
  module Processors
    class Quotes < Processor
      APOSTROPHE_REGEXP = /(\w+)'(\w*)/i
      DOUBLE_QUOTES_REGEXP = /["](.*)["]/i
      SINGLE_QUOTES_REGEXP = /['](.*)[']/i

      def call
        replace_single_quotes
        replace_double_quotes
        replace_apostrophe
        str
      end

      private

      def replace_apostrophe
        str.gsub!(APOSTROPHE_REGEXP, '\1’\2')
      end

      def replace_double_quotes
        str.gsub!(DOUBLE_QUOTES_REGEXP, '“\1”')
      end

      def replace_single_quotes
        str.gsub!(SINGLE_QUOTES_REGEXP, '‘\1’')
      end
    end
  end
end
