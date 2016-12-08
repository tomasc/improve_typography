module ImproveTypography
  module Processors
    class Apostrophe < Processor
      REGEXP = /(\w+)'(\w*)/i

      def call
        replace_apostrophe
      end

      private

      def replace_apostrophe
        str.gsub(REGEXP, "\\1#{apostrophe_sign}\\2")
      end

      def apostrophe_sign
        options.fetch(:apostrophe_sign, I18n.t(:apostrophe_sign, scope: %i(improve_typography), locale: locale))
      end
    end
  end
end
