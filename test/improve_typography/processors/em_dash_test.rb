require 'test_helper'

module ImproveTypography
  module Processors
    describe EmDash do
      describe "do's" do
        it { EmDash.call('you - me').must_equal 'you—me' }
        it { EmDash.call('insert - sentence - here').must_equal 'insert—sentence—here' }

        it { EmDash.call('you -- me').must_equal 'you—me' }
        it { EmDash.call('insert -- sentence -- here').must_equal 'insert—sentence—here' }

        it { EmDash.call('insert --- sentence').must_equal 'insert—sentence' }
      end

      describe "dont's" do
        # it { EmDash.call('2-5').must_equal '2-5' }
      end
    end
  end
end
