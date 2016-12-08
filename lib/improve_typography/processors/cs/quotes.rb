require_relative '../quotes'

module ImproveTypography
  module Processors
    module CS
      class Quotes < ImproveTypography::Processors::Quotes
        def replace_double_quotes
          str.gsub(DOUBLE_QUOTES_REGEXP, '„\1“')
        end

        def replace_single_quotes
          str.gsub(SINGLE_QUOTES_REGEXP, '‚\1‘')
        end
      end
    end
  end
end
