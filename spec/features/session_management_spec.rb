require "rails_helper"

RSpec.feature 'Session management', :type => :feature do
  context 'When user signed up' do
    let(:provider){ :google_oauth2 }
    let(:nickname){ 'Nickname' }
    let(:icon_url){ nil }
    let(:uid){ 'uid000001' }

    before do
      set_auth_mock(provider: provider, nickname: nickname, name: nil, icon_url: icon_url, uid: uid)
    end
    after { unset_auth_mock(provider) }

    scenario 'User signs up' do
      visit '/'
      click_link 'Sign In'
      expect(page).to have_content('Sign Out')
    end
  end

  context 'When user signed up' do
    let(:user){ create(:user) }
    let(:identity){ create(:identity, user: user, provider: :google_oauth2) }

    before do
      set_auth_mock(provider: identity.provider, nickname: user.nickname, name: nil, icon_url: user.icon_url, uid: identity.uid)
    end
    after { unset_auth_mock(identity.provider) }

    scenario 'User signs is' do
      visit '/'
      click_link 'Sign In'
      expect(page).to have_content('Sign Out')
    end
  end

end
