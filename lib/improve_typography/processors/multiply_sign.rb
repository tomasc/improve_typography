module ImproveTypography
  module Processors
    class MultiplySign < Processor
      REGEXP = /(\d+)(\s*)x(\s*)(\d+)/i

      def call
        str.gsub(REGEXP, '\1'+multiply_sign+'\4')
      end

      private

      def multiply_sign
        options.fetch(:multiply_sign, ' × ')
      end
    end
  end
end
