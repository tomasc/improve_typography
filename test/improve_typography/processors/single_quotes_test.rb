require 'test_helper'

module ImproveTypography
  module Processors
    describe SingleQuotes do
      let(:single_quotes) { I18n.t :single_quotes, scope: %i(improve_typography) }

      describe "do's" do
        it { SingleQuotes.call("'so it is not authorless'").must_equal "#{single_quotes[0]}so it is not authorless#{single_quotes[1]}" }
        it { SingleQuotes.call("'so it isn't authorless'").must_equal "#{single_quotes[0]}so it isn't authorless#{single_quotes[1]}" }
      end

      describe "dont's" do
      end
    end
  end
end
