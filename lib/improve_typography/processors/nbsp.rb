module ImproveTypography
  module Processors
    class Nbsp < Processor
      def call
        str
          .gsub(/(\s+)(\S|\d+|\S\.)(\s+)(\S)/, '\1\2&nbsp;\4') # in the middle of string
          .gsub(/\A(\w|\d+|\w\.)(\s+)(\S)/, '\1&nbsp;\3') # at the beginning of string
          .gsub(/([^\S\n])(\S|\d+|\S\.)(\z|[\.?!]\z|[\.?!]\s)/, '&nbsp;\2\3') # at the end of string!!
          .gsub(/(\A|\s+)(©)(\s+)(\d+)/, '\1\2&nbsp;\3')
          .gsub(/(\A|\s+)(No\.|Vol\.)(\s+)(\d+)/, '\1\2&nbsp;\3')
      end
    end
  end
end
