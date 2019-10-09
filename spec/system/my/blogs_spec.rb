# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'My::Blogs', type: :system do
  describe 'User visit my blogs page' do
    context 'When user does not signed in' do
      it 'displays warning' do
        visit my_blogs_path

        expect(page.text).to have_text('You must be logged in to access this section.')
      end
    end

    context 'When user signed in' do
      let(:user) { create(:user) }
      let(:other_user) { create(:user) }
      let!(:user_blogs) { create_list(:blog, 2, author: user) }
      let(:other_user_blogs) { create_list(:blog, 2, author: other_user) }

      before do
        sign_in(user)
      end

      it 'is expected user view own blog list' do
        visit my_blogs_path

        expect(page).to have_text('My blogs')
        user_blogs.each { |blog| expect(page).to have_text(blog.title) }
        other_user_blogs.each { |blog| expect(page).not_to have_text(blog.title) }
      end
    end
  end
end
