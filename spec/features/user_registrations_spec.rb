require 'rails_helper'

RSpec.feature "UserRegistrations", type: :feature do
  context 'With valid invitation' do
    let!(:invitation){ create(:invitation, :with_introducer) }

    scenario 'User visits signup page' do
      visit sign_up_path(token: invitation.token)

      expect(page.status_code).to eq 200
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
