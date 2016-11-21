require 'test_helper'

module ImproveTypography
  module Processors
    describe Quotes do
      describe "do's" do
        it { Quotes.call("'so it is not authorless'").must_equal "‘so it is not authorless’" }
        it { Quotes.call('"so it is not authorless"').must_equal '“so it is not authorless”' }
        it { Quotes.call("'so it isn't authorless'").must_equal "‘so it isn’t authorless’" }
        it { Quotes.call("isn't").must_equal "isn’t" }
        it { Quotes.call("Tomas'").must_equal "Tomas’" }
        it { Quotes.call("Tomas'!").must_equal "Tomas’!" }
      end

      describe "dont's" do
      end
    end
  end
end
