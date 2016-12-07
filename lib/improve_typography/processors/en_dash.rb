module ImproveTypography
  module Processors
    class EnDash < Processor
      REGEXP = /(\w+?)\s+-{1,2}\s+(\w+?)/i

      def call
        str.gsub(REGEXP, '\1'+en_dash_sign+'\2')
      end

      private

      def en_dash_sign
        options.fetch(:en_dash_sign, configuration.en_dash_sign)
      end
    end
  end
end
