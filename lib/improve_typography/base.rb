require 'nokogiri'

module ImproveTypography
  class Base < Struct.new(:str, :options)
    def self.call(*args)
      new(*args).call
    end

    def initialize(str, options = {})
      super(str, options)
    end

    def call
      text_nodes.each do |node|
        processor_classes.each do |processor|
          node.content = processor.call(node.content, options)
        end
      end

      CGI.unescapeHTML doc.to_html.gsub(/\A<div>/, '').gsub(/<\/\s*div>\z/, '').chomp
    end

    private # =============================================================

    def doc
      @doc ||= Nokogiri::HTML::DocumentFragment.parse("<div>#{str}</div>")
    end

    def text_nodes
      doc.xpath('.//text()')
    end

    def configuration
      @configuration ||= Configuration.new
    end

    def processors
      options.fetch(:processors, configuration.processors)
    end

    def processor_classes
      @processor_classes ||= processors.map do |klass|
        processor_for_locale(klass)
      end
    end

    def all_processor_classes
      @all_processor_classes ||= ObjectSpace.each_object(Class).select { |klass| klass < Processor }
    end

    def processor_for_locale(klass)
      name = klass.to_s.split('::').last
      locale_specific_klass = "ImproveTypography::Processors::#{locale.to_s.upcase}::#{name}"
      all_processor_classes.detect { |cls| cls.to_s == locale_specific_klass } || klass
    end

    def locale
      options.fetch(:locale, I18n.locale)
    end
  end
end
