require 'test_helper'

module ImproveTypography
  module Processors
    describe EmDash do
      let(:em_dash_sign) { I18n.t :em_dash_sign, scope: %i(improve_typography) }

      describe "do's" do
        it { EmDash.call('you - me').must_equal "you#{em_dash_sign}me" }
        it { EmDash.call('insert - sentence - here').must_equal "insert#{em_dash_sign}sentence#{em_dash_sign}here" }

        it { EmDash.call('you -- me').must_equal "you#{em_dash_sign}me" }
        it { EmDash.call('insert -- sentence -- here').must_equal "insert#{em_dash_sign}sentence#{em_dash_sign}here" }

        it { EmDash.call('insert --- sentence').must_equal "insert#{em_dash_sign}sentence" }
      end

      describe "options" do
        let(:em_dash_sign) { ' – ' }
        it { EmDash.call('you - me', em_dash_sign: em_dash_sign).must_equal "you#{em_dash_sign}me" }
      end

      describe "dont's" do
        # it { EmDash.call('2-5').wont_equal '2-5' }
      end
    end
  end
end
