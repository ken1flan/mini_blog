# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'My', type: :system do
  context 'When user does not signed in' do
    it 'displays warning' do
      visit my_index_path

      expect(page.text).to have_text('You must be logged in to access this section.')
    end
  end

  context 'When user signed in' do
    let(:user) { create(:user) }

    before do
      sign_in(user)
    end

    it 'displays my page' do
      visit my_index_path

      expect(page).to have_text('My page')
      expect(page).to have_text(user.nickname)
    end
  end
end
