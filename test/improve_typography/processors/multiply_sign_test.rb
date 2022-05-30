require 'test_helper'

module ImproveTypography
  module Processors
    describe MultiplySign do
      let(:multiply_sign) { I18n.t :multiply_sign, scope: %i(improve_typography) }

      describe "do's" do
        it { _(MultiplySign.call('2x10')).must_equal "2#{multiply_sign}10" }
        it { _(MultiplySign.call('2 x 10')).must_equal "2#{multiply_sign}10" }
        it { _(MultiplySign.call('a 200x1 b')).must_equal "a 200#{multiply_sign}1 b" }
        it { _(MultiplySign.call('25,6 x 17.9')).must_equal "25,6#{multiply_sign}17.9" }
        it { _(MultiplySign.call('½ x ½')).must_equal "½#{multiply_sign}½" }
      end

      describe "options" do
        let(:multiply_sign) { '×' }
        it { _(MultiplySign.call('2x10', multiply_sign: multiply_sign)).must_equal "2#{multiply_sign}10" }
      end

      describe "dont's" do
        it { _(MultiplySign.call('x + y')).must_equal 'x + y' }
        it { _(MultiplySign.call('mexico')).must_equal 'mexico' }
      end
    end
  end
end
