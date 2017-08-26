require 'rails_helper'

RSpec.feature "UserRegistrations", type: :feature do
  context 'With valid invitation' do
    let!(:invitation){ create(:invitation, :with_introducer) }

    scenario 'Use tries to regist user' do
      visit new_user_path(token: invitation.token)

      expect(page.status_code).to eq 200
    end
  end

  context 'With no invitation' do
    scenario 'Use tries to regist user' do
      expect { visit new_user_path }.to raise_error('Not Found')
    end
  end

  context 'With a expired invitation' do
    let!(:invitation){ create(:invitation, :with_introducer, :expired) }

    scenario 'Use tries to regist user' do
      expect { visit new_user_path(token: invitation.token) }.to raise_error('Not Found')
    end
  end
end
