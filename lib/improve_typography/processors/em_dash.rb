module ImproveTypography
  module Processors
    class EmDash < Processor
      REGEXP = /(\w+?)\s+-{1,3}\s+(\w+?)/i

      def call
        str.gsub(REGEXP, '\1'+em_dash_sign+'\2')
      end

      private

      def em_dash_sign
        options.fetch(:em_dash_sign, configuration.em_dash_sign)
      end
    end
  end
end
