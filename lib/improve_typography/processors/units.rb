module ImproveTypography
  module Processors
    class Units < Processor
      REGEXP = /(\d\s*)(m|mm|cm|km)(2|3)/

      def call
        return str unless str.match?(REGEXP)
        str.gsub(REGEXP, '\1\2<sup>\3</sup>')
      end
    end
  end
end
