# TODO: add config whether to use endash ('x – x') or emdash ('x—x') in text

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
