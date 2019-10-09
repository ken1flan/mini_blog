# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'My::Blogs', type: :request do
  describe 'GET /my/blogs' do
    context 'When user does not logged in' do
      it 'is returned 302' do
        get my_blogs_path
        expect(response).to have_http_status(302)
      end
    end

    context 'When user logged in' do
      let(:user) { create(:user, :with_identity) }

      before do
        sign_in(user)
      end

      it 'is returned 200 OK' do
        get my_blogs_path
        expect(response).to have_http_status(200)
      end
    end
  end
end
