module ImproveTypography
  module Processors
    class SingleQuotes < Processor
      def call
        return str unless sign_exists?(single_quotes)
        return str unless str.match?(regexp)
        replace_single_quotes
      end

      private

      def replace_single_quotes
        str.gsub(regexp, "#{single_quotes[0]}\\1#{single_quotes[1]}")
      end

      def regexp
        @regexp ||= Regexp.new("(?<=\\A|\\W)['#{single_quotes[0]}#{single_quotes[1]}](.*?)['#{single_quotes[0]}#{single_quotes[1]}](?!\\w)")
      end

      def single_quotes
        options.fetch(:single_quotes, translation(:single_quotes))
      end
    end
  end
end
