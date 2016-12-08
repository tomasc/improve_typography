module ImproveTypography
  module Processors
    class SingleQuotes < Processor
      REGEXP = /['](.*)[']/i

      def call
        replace_single_quotes
      end

      private

      def replace_single_quotes
        str.gsub(REGEXP, "#{single_quotes[0]}\\1#{single_quotes[1]}")
      end

      def single_quotes
        options.fetch(:single_quotes, I18n.t(:single_quotes, scope: %i(improve_typography), locale: locale))
      end
    end
  end
end
