module ImproveTypography
  class Processor < Struct.new(:str, :options)
    def self.call(*args)
      new(*args).call
    end

    def initialize(str, options = {})
      super(str, options)
    end

    def call
      raise NotImplemented
    end
  end
end
