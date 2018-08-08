module ImproveTypography
  module Processors
    class DoubleQuotes < Processor
      def call
        replace_double_quotes
      end

      private

      def replace_double_quotes
        str.gsub(regexp, "#{double_quotes[0]}\\1#{double_quotes[1]}" )
      end

      def regexp
        @regexp ||= Regexp.new("[\"#{double_quotes[0]}#{double_quotes[1]}](.*?)[\"#{double_quotes[0]}#{double_quotes[1]}](?!\\w)")
      end

      def double_quotes
        options.fetch(:double_quotes, I18n.t(:double_quotes, scope: %i(improve_typography), locale: locale))
      end
    end
  end
end
