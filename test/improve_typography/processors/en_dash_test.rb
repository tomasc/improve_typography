require 'test_helper'

module ImproveTypography
  module Processors
    describe EnDash do
      describe "do's" do
        it { EnDash.call('you - me').must_equal 'you – me' }
        it { EnDash.call('insert - sentence - here').must_equal 'insert – sentence – here' }

        it { EnDash.call('you -- me').must_equal 'you – me' }
        it { EnDash.call('insert -- sentence -- here').must_equal 'insert – sentence – here' }

        it { EnDash.call('June 15 - June 20').must_equal 'June 15 – June 20' }
        it { EnDash.call('19/6/2016 - 30/10/2016').must_equal '19/6/2016 – 30/10/2016' }
      end

      describe "dont's" do
        it { EnDash.call('2-5').must_equal '2-5' }
      end
    end
  end
end
