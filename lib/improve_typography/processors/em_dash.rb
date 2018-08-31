module ImproveTypography
  module Processors
    class EmDash < Processor
      REGEXP = /(\w+?)\s+-{1,3}\s+(\w+?)/i

      def call
        return str unless str.match?(/-{1,3}/)
        str.gsub(REGEXP, '\1'+em_dash_sign+'\2')
      end

      private

      def em_dash_sign
        options.fetch(:em_dash_sign, I18n.t(:em_dash_sign, scope: %i(improve_typography), locale: locale))
      end
    end
  end
end
