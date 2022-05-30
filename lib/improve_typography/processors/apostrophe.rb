module ImproveTypography
  module Processors
    class Apostrophe < Processor
      REGEXP = /(\w+)'(\w*)/i

      def call
        return str unless sign_exists?(apostrophe_sign)
        return str unless str.match?(/'/)
        replace_apostrophe
      end

      private

      def replace_apostrophe
        str.gsub(REGEXP, "\\1#{apostrophe_sign}\\2")
      end

      def apostrophe_sign
        options.fetch(:apostrophe_sign, translation(:apostrophe_sign))
      end
    end
  end
end
