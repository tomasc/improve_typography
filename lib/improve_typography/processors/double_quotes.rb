module ImproveTypography
  module Processors
    class DoubleQuotes < Processor
      REGEXP = /["“”](.*?)["“”]/i

      def call
        replace_double_quotes
      end

      private

      def replace_double_quotes
        str.gsub(REGEXP, "#{double_quotes[0]}\\1#{double_quotes[1]}" )
      end

      def double_quotes
        options.fetch(:double_quotes, I18n.t(:double_quotes, scope: %i(improve_typography), locale: locale))
      end
    end
  end
end
