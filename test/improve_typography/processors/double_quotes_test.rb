require 'test_helper'

module ImproveTypography
  module Processors
    describe DoubleQuotes do
      let(:double_quotes) { I18n.t :double_quotes, scope: %i(improve_typography) }

      describe "do's" do
        it { DoubleQuotes.call('"so it is not authorless"').must_equal "#{double_quotes[0]}so it is not authorless#{double_quotes[1]}" }
      end

      describe "dont's" do
      end
    end
  end
end
