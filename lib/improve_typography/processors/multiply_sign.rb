module ImproveTypography
  module Processors
    class MultiplySign < Processor
      REGEXP = /(\d+|[½⅓¼⅔⅛⅜⅝⅞])(\s*)x(\s*)(\d+|[½⅓¼⅔⅛⅜⅝⅞])/i

      def call
        return str unless multiply_sign
        return str unless str.match?(REGEXP)

        str.gsub(REGEXP, '\1'+multiply_sign+'\4')
      end

      private

      def multiply_sign
        options.fetch(:multiply_sign, I18n.t(:multiply_sign, scope: %i(improve_typography), locale: locale))
      end
    end
  end
end
