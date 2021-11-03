require 'test_helper'

module ImproveTypography
  module Processors
    describe Nbsp do
      describe "do's" do
        it { _(Nbsp.call('and interdependent, sharing a common time.')).must_equal 'and interdependent, sharing a&nbsp;common time.' }
        it { _(Nbsp.call('with 35 years of clips')).must_equal 'with 35&nbsp;years of clips' }
        it { _(Nbsp.call('Andrew W. Mellon')).must_equal 'Andrew W.&nbsp;Mellon' }
        it { _(Nbsp.call('Width 1')).must_equal 'Width&nbsp;1' }
        it { _(Nbsp.call('Width 1? Hmm')).must_equal 'Width&nbsp;1? Hmm' }
        it { _(Nbsp.call('1 Width')).must_equal '1&nbsp;Width' }
        it { _(Nbsp.call('Hmm. 1 Width')).must_equal 'Hmm. 1&nbsp;Width' }
        it { _(Nbsp.call('Title. © 2016')).must_equal 'Title. ©&nbsp;2016' }
        it { _(Nbsp.call('Title, Vol. 2')).must_equal 'Title, Vol.&nbsp;2' }
        it { _(Nbsp.call('Title, No. 3')).must_equal 'Title, No.&nbsp;3' }
        it { _(Nbsp.call('© 2002 Author')).must_equal '©&nbsp;2002&nbsp;Author' }
      end

      describe "dont's" do
        it { _(Nbsp.call("\n2009")).wont_equal "&nbsp;2009" }
        it { _(Nbsp.call(", (2009)")).wont_equal ",&nbsp;(2009)" }
      end
    end
  end
end
