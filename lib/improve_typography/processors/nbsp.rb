module ImproveTypography
  module Processors
    class Nbsp < Processor
      def call
        str
          .gsub(/(\s+)(.|\d+|.\.)(\s+)(.)/, '\1\2&nbsp;\4') # in the middle of string
          .gsub(/\A(.|\d+|.\.)(\s+)(.)/, '\1&nbsp;\3') # at the beginning of string
          .gsub(/(\s+)(.|\d+|.\.)(\z|[\.?!]\z|[\.?!]\s)/, '&nbsp;\2\3') # at the end of string
          .gsub(/(\A|\s+)(©)(\s+)(\d+)/, '\1\2&nbsp;\3')
          .gsub(/(\A|\s+)(No\.|Vol\.)(\s+)(\d+)/, '\1\2&nbsp;\3')
      end
    end
  end
end
