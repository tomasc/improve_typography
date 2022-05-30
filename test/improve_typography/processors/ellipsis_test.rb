require 'test_helper'

module ImproveTypography
  module Processors
    describe Ellipsis do
      let(:ellipsis_sign) { I18n.t :ellipsis_sign, scope: %i(improve_typography) }

      describe "do's" do
        it { _(Ellipsis.call('...')).must_equal ellipsis_sign }
        it { _(Ellipsis.call('......')).must_equal ellipsis_sign }

        it { _(Ellipsis.call('Someday...')).must_equal "Someday#{ellipsis_sign}" }
        it { _(Ellipsis.call('Someday ...')).must_equal "Someday #{ellipsis_sign}" }
        it { _(Ellipsis.call('something . . . if this')).must_equal "something #{ellipsis_sign} if this" }
      end

      describe "dont's" do
        it { _(Ellipsis.call('...', locale: :da)).must_equal '...' }
        it { _(Ellipsis.call('Some.')).must_equal 'Some.' }
        it { _(Ellipsis.call('2..5')).must_equal '2..5' }
      end
    end
  end
end
