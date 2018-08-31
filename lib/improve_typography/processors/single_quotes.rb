module ImproveTypography
  module Processors
    class SingleQuotes < Processor
      def call
        return str unless str.match?(/[\'#{single_quotes[0]}#{single_quotes[1]}]/)
        replace_single_quotes
      end

      private

      def replace_single_quotes
        str.gsub(regexp, "#{single_quotes[0]}\\1#{single_quotes[1]}")
      end

      def regexp
        @regexp ||= Regexp.new("['#{single_quotes[0]}#{single_quotes[1]}](.*?)['#{single_quotes[0]}#{single_quotes[1]}](?!\\w)")
      end

      def single_quotes
        options.fetch(:single_quotes, I18n.t(:single_quotes, scope: %i(improve_typography), locale: locale))
      end
    end
  end
end
