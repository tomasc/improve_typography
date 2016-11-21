require 'test_helper'

module ImproveTypography
  module Processors
    describe Ellipsis do
      describe "do's" do
        it { Ellipsis.call('...').must_equal '…' }
        it { Ellipsis.call('......').must_equal '…' }

        it { Ellipsis.call('Someday...').must_equal 'Someday…' }
        it { Ellipsis.call('Someday ...').must_equal 'Someday …' }
      end

      describe "dont's" do
        it { Ellipsis.call('Some.').must_equal 'Some.' }
        it { Ellipsis.call('2..5').must_equal '2..5' }
      end
    end
  end
end
