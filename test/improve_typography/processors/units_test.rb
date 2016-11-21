require 'test_helper'

module ImproveTypography
  module Processors
    describe Units do
      describe "do's" do
        it { Units.call('50    %').must_equal '50 %' }
        it { Units.call('50   mm  ').must_equal '50 mm  ' }

        it { Units.call('50 m2').must_equal '50 m<sup>2</sup>' }
        it { Units.call('50 mm3').must_equal '50 mm<sup>3</sup>' }
      end

      describe "dont's" do
        it { Units.call('50   mmhm!').must_equal '50   mmhm!' }
      end
    end
  end
end
