require 'test_helper'

module ImproveTypography
  module Processors
    describe Unicode do
      describe "do's" do
        it { Unicode.call("We always begin with a conversation. Within the dialogue, one idea becomes many.").must_equal %{We always begin with a conversation.\nWithin the dialogue, one idea becomes many.} }
      end

      describe "dont's" do
      end
    end
  end
end
