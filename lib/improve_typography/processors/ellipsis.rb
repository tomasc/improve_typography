module ImproveTypography
  module Processors
    class Ellipsis < Processor
      REGEXP = /(\.\s*?){3,}/i

      def call
        return str unless sign_exists?(ellipsis_sign)
        return str unless str.match?(REGEXP)

        str.gsub(REGEXP, ellipsis_sign)
      end

      private

      def ellipsis_sign
        options.fetch(:ellipsis_sign, translation(:ellipsis_sign))
      end
    end
  end
end
