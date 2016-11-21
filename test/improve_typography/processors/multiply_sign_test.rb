require 'test_helper'

module ImproveTypography
  module Processors
    describe MultiplySign do
      describe "do's" do
        it { MultiplySign.call('2x10').must_equal '2 × 10' }
        it { MultiplySign.call('2 x 10').must_equal '2 × 10' }
        it { MultiplySign.call('a 200x1 b').must_equal 'a 200 × 1 b' }
        it { MultiplySign.call('25,6 x 17.9').must_equal '25,6 × 17.9' }
      end

      describe "dont's" do
        it { MultiplySign.call('x + y').must_equal 'x + y' }
        it { MultiplySign.call('mexico').must_equal 'mexico' }
      end
    end
  end
end
