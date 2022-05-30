require 'test_helper'

module ImproveTypography
  module Processors
    describe Units do
      describe "do's" do
        it { _(Units.call('50 m2')).must_equal '50 m<sup>2</sup>' }
        it { _(Units.call('50 mm3')).must_equal '50 mm<sup>3</sup>' }
      end

      describe "dont's" do
      end
    end
  end
end
