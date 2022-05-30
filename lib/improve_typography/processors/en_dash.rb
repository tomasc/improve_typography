module ImproveTypography
  module Processors
    class EnDash < Processor
      REGEXP = /(\w+?)\s+-{1,2}\s+(\w+?)/i

      def call
        return str unless sign_exists?(en_dash_sign)
        return str unless str.match?(/-{1,3}/)
        str.gsub(REGEXP, '\1'+en_dash_sign+'\2')
      end

      private

      def en_dash_sign
        options.fetch(:en_dash_sign, translation(:en_dash_sign))
      end
    end
  end
end
