module ImproveTypography
  module Processors
    class Ellipsis < Processor
      REGEXP = /\.{3,}/i

      def call
        return str unless ellipsis_sign

        str.gsub(REGEXP, ellipsis_sign)
      end

      private

      def ellipsis_sign
        options.fetch(:ellipsis_sign, I18n.t(:ellipsis_sign, scope: %i(improve_typography), locale: locale))
      end
    end
  end
end
