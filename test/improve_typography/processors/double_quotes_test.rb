require 'test_helper'

module ImproveTypography
  module Processors
    describe DoubleQuotes do
      let(:double_quotes) { I18n.t :double_quotes, scope: %i(improve_typography) }

      describe "do's" do
        it { _(DoubleQuotes.call('"so it is not authorless"')).must_equal "#{double_quotes[0]}so it is not authorless#{double_quotes[1]}" }
        it { _(DoubleQuotes.call('"2 + 2 = 6"')).must_equal "#{double_quotes[0]}2 + 2 = 6#{double_quotes[1]}" }
        it { _(DoubleQuotes.call('"2 + 2 = 6" and "2 - 2 = 0"')).must_equal "#{double_quotes[0]}2 + 2 = 6#{double_quotes[1]} and #{double_quotes[0]}2 - 2 = 0#{double_quotes[1]}" }
        it { _(DoubleQuotes.call('“2 + 2 = 6” and ”2 - 2 = 0”')).must_equal "#{double_quotes[0]}2 + 2 = 6#{double_quotes[1]} and #{double_quotes[0]}2 - 2 = 0#{double_quotes[1]}" }
        it { _(DoubleQuotes.call('”2 + 2 = 6” and ”2 - 2 = 0”')).must_equal "#{double_quotes[0]}2 + 2 = 6#{double_quotes[1]} and #{double_quotes[0]}2 - 2 = 0#{double_quotes[1]}" }
      end

      describe "dont's" do
        it { _(DoubleQuotes.call('"so it is not authorless"', locale: :da)).must_equal '"so it is not authorless"' }
      end
    end
  end
end
