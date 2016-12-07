require 'test_helper'

describe ImproveTypography::Base do
  let(:text) { "'So it isn't authorless'. Maybe... Or 2 -- 4?" }
  let(:result) { ImproveTypography::Base.call(text) }

  describe 'default locale' do
    it 'processes text' do
      result.must_equal "‘So it isn’t authorless’. Maybe… Or 2 – 4?"
    end
  end

  describe 'specific locale' do
    let(:result) { ImproveTypography::Base.call(text, locale: :cs) }

    it 'processes text' do
      result.must_equal "‚So it isn’t authorless‘. Maybe… Or 2 – 4?"
    end
  end
end
