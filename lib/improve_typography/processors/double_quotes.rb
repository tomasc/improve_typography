module ImproveTypography
  module Processors
    class DoubleQuotes < Processor
      def call
        return str unless sign_exists?(double_quotes)
        return str unless str.match?(/[\"#{double_quotes[0]}#{double_quotes[1]}]/)
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
        options.fetch(:double_quotes, translation(:double_quotes))
      end
    end
  end
end
