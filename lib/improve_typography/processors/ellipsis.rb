module ImproveTypography
  module Processors
    class Ellipsis < Processor
      REGEXP = /(\.\s*?){3,}/i

      def call
        return str unless ellipsis_sign
        return str unless str.match?(REGEXP)

        str.gsub(REGEXP, ellipsis_sign)
      end

      private

      def ellipsis_sign
        options.fetch(:ellipsis_sign, I18n.t(:ellipsis_sign, scope: %i(improve_typography), locale: locale))
      end
    end
  end
end
