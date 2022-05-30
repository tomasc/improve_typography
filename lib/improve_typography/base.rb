require 'nokogiri'

module ImproveTypography
  class Base < Struct.new(:str, :options)
    class << self
      def all_processor_classes
        @@all_processor_classes ||= []
      end

      def add_processor_class(klass)
        unless all_processor_classes.include?(klass)
          all_processor_classes << klass
        end
      end

      def call(*args)
        new(*args).call
      end
    end

    def initialize(str, options = {})
      super(str, options)
    end

    def call
      return str unless processor_classes.count > 0

      doc.xpath('.//text()').each do |node|
        processor_classes.each do |processor|
          node.content = processor.call(node.content, options)
        end
      end

      CGI.unescapeHTML(
        doc.to_html.strip[5..-7]
      )
    end

    private

    def doc
      @doc ||= Nokogiri::HTML::DocumentFragment.parse("<div>#{str}</div>")
    end

    def processors
      options.fetch(:processors, ImproveTypography.configuration.processors)
    end

    def processor_classes
      @processor_classes ||= processors.map do |klass|
        processor_for_locale(klass)
      end
    end

    def all_processor_classes
      self.class.all_processor_classes
    end

    def processor_for_locale(klass)
      @processor_for_locale ||= {}
      @processor_for_locale[klass] ||= begin
        name = klass.to_s.split('::').last
        locale_specific_klass = "ImproveTypography::Processors::#{locale.to_s.upcase}::#{name}"
        all_processor_classes.detect { |cls| cls.to_s == locale_specific_klass } || klass
      end
    end

    def locale
      options.fetch(:locale, I18n.locale)
    end
  end
end
