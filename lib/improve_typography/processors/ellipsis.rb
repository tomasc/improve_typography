module ImproveTypography
  module Processors
    class Ellipsis < Processor
      REGEXP = /\.{3,}/i

      def call
        str.gsub(REGEXP, ellipsis_sign)
      end

      private

      def ellipsis_sign
        options.fetch(:ellipsis_sign, '…')
      end
    end
  end
end
