require 'test_helper'

module ImproveTypography
  module Processors
    describe Nbsp do
      describe 'single character' do
        it { Nbsp.call('and interdependent, sharing a common time.').must_equal 'and interdependent, sharing a&nbsp;common time.' }
        it { Nbsp.call('with 35 years of clips').must_equal 'with 35&nbsp;years of clips' }
        it { Nbsp.call('Andrew W. Mellon').must_equal 'Andrew W.&nbsp;Mellon' }
      end
    end
  end
end
