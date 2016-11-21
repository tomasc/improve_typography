module ImproveTypography
  module Processors
    class Units < Processor
      SPACE_REGEXP = /(\d+)\s+(%|‰|‱|℃|℉|°|(Y|Z|E|P|T|G|M|k|h|da|d|m|µ|n|p|f|a|z|y)?(m(²|³)?|g|s|h|A|K|cd|mol|Ω|℃|℉)(\s|\z))/
      EXP_REGEXP = /(\d)(\s*)(m|mm|cm|km)(2|3)/

      def call
        remove_space_between_number_and_units
        replace_exponents
        str
      end

      private

      def remove_space_between_number_and_units
        str.gsub!(SPACE_REGEXP, '\1 \2')
      end

      def replace_exponents
        str.gsub!(EXP_REGEXP, '\1\2\3<sup>\4</sup>')
      end
    end
  end
end
