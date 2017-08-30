require 'rails_helper'

RSpec.feature "UserRegistrations", type: :feature do
  context 'With valid invitation' do
    let!(:invitation){ create(:invitation, :with_introducer) }
    let(:provider){ :google_oauth2 }
    let(:nickname){ 'Nickname' }
    let(:icon_url){ nil }
    let(:uid){ 'uid000001' }

    before do
      set_auth_mock(provider: provider, nickname: nickname, name: nil, icon_url: icon_url, uid: uid)
    end
    after { unset_auth_mock(provider) }

    scenario 'User visits signup page' do
      visit sign_up_path(token: invitation.token)
      expect(page.status_code).to eq 200

      click_link "Sign up with google account"
      # TODO: user resistration spec
    end
  end

  context 'With no invitation' do
    scenario 'User visits signup page' do
      expect { visit sign_up_path }.to raise_error('Not Found')
    end
  end

  context 'With a expired invitation' do
    let!(:invitation){ create(:invitation, :with_introducer, :expired) }

    scenario 'User visits signup page' do
      expect { visit sign_up_path(token: invitation.token) }.to raise_error('Not Found')
    end
  end
end
