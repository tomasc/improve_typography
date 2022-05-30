require 'test_helper'

module ImproveTypography
  module Processors
    describe SingleQuotes do
      let(:single_quotes) { I18n.t :single_quotes, scope: %i(improve_typography) }

      describe "do's" do
        it { _(SingleQuotes.call("'so it is not authorless'")).must_equal "#{single_quotes[0]}so it is not authorless#{single_quotes[1]}" }
        it { _(SingleQuotes.call("'so it isn't authorless' or 'it doesn't seem that way'")).must_equal "#{single_quotes[0]}so it isn't authorless#{single_quotes[1]} or #{single_quotes[0]}it doesn't seem that way#{single_quotes[1]}" }
        it { _(SingleQuotes.call("'2 + 2 = 6'")).must_equal "#{single_quotes[0]}2 + 2 = 6#{single_quotes[1]}" }
        it { _(SingleQuotes.call("’2 + 2 = 6’ and ’1 + 1 = 99’")).must_equal "#{single_quotes[0]}2 + 2 = 6#{single_quotes[1]} and #{single_quotes[0]}1 + 1 = 99#{single_quotes[1]}" }
        it { _(SingleQuotes.call("‘2 + 2 = 6‘ and ‘1 + 1 = 99‘")).must_equal "#{single_quotes[0]}2 + 2 = 6#{single_quotes[1]} and #{single_quotes[0]}1 + 1 = 99#{single_quotes[1]}" }
      end

      describe "dont's" do
        it { _(SingleQuotes.call("Serbia's workers' society")).must_equal "Serbia's workers' society" }
      end
    end
  end
end
