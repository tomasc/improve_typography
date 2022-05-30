require 'test_helper'

module ImproveTypography
  module Processors
    describe Apostrophe do
      let(:apostrophe_sign) { I18n.t :apostrophe_sign, scope: %i(improve_typography) }

      describe "do's" do
        it { _(Apostrophe.call("isn't")).must_equal "isn#{apostrophe_sign}t" }
        it { _(Apostrophe.call("Tomas'")).must_equal "Tomas#{apostrophe_sign}" }
        it { _(Apostrophe.call("Tomas'!")).must_equal "Tomas#{apostrophe_sign}!" }
      end

      describe "dont's" do
        it { _(Apostrophe.call("isn't", locale: :da)).must_equal "isn't" }
      end
    end
  end
end
