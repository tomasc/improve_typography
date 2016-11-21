module ImproveTypography
  module Processors
    class MultiplySign < Processor
      REGEXP = /(\d+)(\s*)x(\s*)(\d+)/i

      def call
        str.gsub(REGEXP, '\1 × \4')
      end
    end
  end
end
