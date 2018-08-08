module ImproveTypography
  module Processors
    class Nbsp < Processor
      def call

        str
          .gsub(/(\s+|&nbsp;)([^–\s])(\s+|&nbsp;)(\S)/, '\1\2&nbsp;\4') # in the middle of string
          .gsub(/(\s+|&nbsp;)(\d+)(\s+|&nbsp;)(\S)/, '\1\2&nbsp;\4')
          .gsub(/(\s+|&nbsp;)(\d+\.)(\s+|&nbsp;)(\S)/, '\1\2&nbsp;\4')
          .gsub(/(\s+|&nbsp;)(\S\.)(\s+|&nbsp;)(\S)/, '\1\2&nbsp;\4')
          .gsub(/\A(\w)(\s+)(\S)/, '\1&nbsp;\3') # at the beginning of string
          .gsub(/\A(\d+)(\s+)(\S)/, '\1&nbsp;\3')
          .gsub(/\A(\w\.)(\s+)(\S)/, '\1&nbsp;\3')
          .gsub(/([^\S\n])([^–\s])(\z|[\.?!]\z|[\.?!]\s)/, '&nbsp;\2\3') # at the end of string!!
          .gsub(/([^\S\n])([^–\s]\.)(\z|[\.?!]\z|[\.?!]\s)/, '&nbsp;\2\3')
          .gsub(/([^\S\n])(\d+)(\z|[\.?!]\z|[\.?!]\s)/, '&nbsp;\2\3')
          .gsub(/(\A|\s+)(©)(\s+)(\d+)/, '\1\2&nbsp;\4')
          .gsub(/(\A|\s+)(No\.|Vol\.)(\s+)(\d+)/, '\1\2&nbsp;\3')
      end
    end
  end
end
