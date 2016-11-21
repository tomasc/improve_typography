module ImproveTypography
  module Processors
    class EnDash < Processor
      REGEXP = /(\w+?)\s+-+\s+(\w+?)/i

      def call
        str.gsub(REGEXP, '\1 – \2')
      end
    end
  end
end