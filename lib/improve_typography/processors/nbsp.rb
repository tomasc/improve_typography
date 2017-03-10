module ImproveTypography
  module Processors
    class Nbsp < Processor
      def call
        str.gsub(/(\s+)(.|\d+|.\.)(\s+)(.)/, '\1\2&nbsp;\4')
      end
    end
  end
end
