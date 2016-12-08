require 'test_helper'

module ImproveTypography
  module Processors
    describe EnDash do
      let(:en_dash_sign) { I18n.t :en_dash_sign, scope: %i(improve_typography) }

      describe "do's" do
        it { EnDash.call('June 15 - June 20').must_equal "June 15#{en_dash_sign}June 20" }
        it { EnDash.call('19/6/2016 - 30/10/2016').must_equal "19/6/2016#{en_dash_sign}30/10/2016" }
        it { EnDash.call('A -- B').must_equal "A#{en_dash_sign}B" }
      end

      describe "dont's" do
        it { EnDash.call('2-5').must_equal '2-5' }
      end
    end
  end
end
