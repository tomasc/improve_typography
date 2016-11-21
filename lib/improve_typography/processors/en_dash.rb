# TODO: add config whether to use endash ('x – x') or emdash ('x—x') in text

module ImproveTypography
  module Processors
    class EnDash < Processor
      TEXT_REGEXP = /(\w+?)\s+-+\s+(\w+?)/i

      def call
        replace_en_dash_in_text
        str
      end

      private

      def replace_en_dash_in_text
        str.gsub!(TEXT_REGEXP, '\1 – \2')
      end
    end
  end
end
