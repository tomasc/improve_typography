require 'test_helper'

module ImproveTypography
  module Processors
    module CS
      describe Quotes do
        describe "do's" do
          it { Quotes.call("'so it is not authorless'").must_equal "‚so it is not authorless‘" }
          it { Quotes.call('"so it is not authorless"').must_equal '„so it is not authorless“' }
        end

        describe "dont's" do
        end
      end
    end
  end
end
