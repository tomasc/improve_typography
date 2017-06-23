require 'test_helper'

describe ImproveTypography::Base do
  let(:text) { "'So it isn't authorless'. Maybe... Or 2 -- 4?" }
  let(:result) { ImproveTypography::Base.call(text) }

  let(:apostrophe_sign) { I18n.t :apostrophe_sign, scope: %i(improve_typography) }
  let(:ellipsis_sign) { I18n.t :ellipsis_sign, scope: %i(improve_typography) }
  let(:en_dash_sign) { I18n.t :en_dash_sign, scope: %i(improve_typography) }
  let(:single_quotes) { I18n.t :single_quotes, scope: %i(improve_typography) }
  let(:en_dash_sign_with_nbsp) { en_dash_sign.gsub(' ', '&nbsp;') }

  describe 'default locale' do
    it { result.must_equal "#{single_quotes[0]}So it isn#{apostrophe_sign}t authorless#{single_quotes[1]}. Maybe#{ellipsis_sign} Or 2#{en_dash_sign_with_nbsp}4?" }
  end

  describe 'locale' do
    let(:locale) { :cs }
    let(:single_quotes) { I18n.t :single_quotes, scope: %i(improve_typography), locale: locale }

    describe 'local' do
      let(:result) { ImproveTypography::Base.call(text, locale: locale) }

      it { result.must_equal "#{single_quotes[0]}So it isn#{apostrophe_sign}t authorless#{single_quotes[1]}. Maybe#{ellipsis_sign} Or 2#{en_dash_sign_with_nbsp}4?" }
    end

    describe 'global' do
      before { I18n.locale = locale }
      after { I18n.locale = I18n.default_locale }

      it { result.must_equal "‚So it isn’t authorless‘. Maybe… Or 2&nbsp;–&nbsp;4?" }
    end
  end

  describe 'skips tags' do
    let(:text) { '<span class="foo" data-value="3">2 -- 4</span>' }
    it { result.must_equal '<span class="foo" data-value="3">2&nbsp;–&nbsp;4</span>' }
  end
end
