module ImproveTypography
  module Processors
    class Ellipsis < Processor
      REGEXP = /\.{3,}/i

      def call
        str.gsub(REGEXP, '…')
      end
    end
  end
end
