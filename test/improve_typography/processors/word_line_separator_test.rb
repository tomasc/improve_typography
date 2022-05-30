require 'test_helper'

module ImproveTypography
  module Processors
    describe WordLineSeparator do
      describe "do's" do
        it { _(WordLineSeparator.call("We always begin with a conversation. Within the dialogue, one idea becomes many.")).must_equal %{We always begin with a conversation.\nWithin the dialogue, one idea becomes many.} }
      end

      describe "dont's" do
      end
    end
  end
end
