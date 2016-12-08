require 'test_helper'

describe ImproveTypography::Base do
  let(:text) { "'So it isn't authorless'. Maybe... Or 2 -- 4?" }
  let(:result) { ImproveTypography::Base.call(text) }

  describe 'default locale' do
    it { result.must_equal "‘So it isn’t authorless’. Maybe… Or 2 – 4?" }
  end

  describe 'specific locale' do
    let(:result) { ImproveTypography::Base.call(text, locale: :cs) }
    it { result.must_equal "‚So it isn’t authorless‘. Maybe… Or 2 – 4?" }
  end

  describe 'skips tags' do
    let(:text) { '<span class="foo" data-value="3">2 -- 4</span>' }
    it { result.must_equal '<span class="foo" data-value="3">2 – 4</span>' }
  end
end
