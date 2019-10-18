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

  describe 'GET /my/blogs/new' do
    context 'When user does not logged in' do
      it 'is returned 302' do
        get new_my_blog_path
        expect(response).to have_http_status(302)
      end
    end

    context 'When user logged in' do
      let(:user) { create(:user, :with_identity) }

      before do
        sign_in(user)
      end

      it 'is returned 200 OK' do
        get new_my_blog_path
        expect(response).to have_http_status(200)
      end
    end
  end

  describe 'POST /my/blogs' do
    context 'When user does not logged in' do
      it 'is returned 302' do
        post my_blogs_path
        expect(response).to have_http_status(302)
      end
    end

    context 'When user logged in' do
      let(:user) { create(:user, :with_identity) }

      before do
        sign_in(user)
      end

      context 'When blog is written by user' do
        context 'With valid params' do
          let(:params) { { form_blog_contribution: { title: 'new title', body: 'new body' } } }

          it 'is returned 200 OK' do
            post my_blogs_path, params: params
            expect(response).to have_http_status(200)
            body = response.body
            expect(body).to include 'new title'
            expect(body).to include 'new body'
          end
        end

        context 'With invalid params' do
          let(:params) { { form_blog_contribution: { title: '', body: 'new body' } } }

          it 'is returned 200 OK' do
            post my_blogs_path, params: params
            expect(response).to have_http_status(200)
            expect(response).to render_template(:new)
          end
        end
      end
    end
  end

  describe 'GET /my/blogs/:id' do
    let(:other_user_blog) { create(:blog, author) }

    context 'When user does not logged in' do
      let(:blog) { create(:blog, :with_author) }

      it 'is returned 302' do
        get my_blog_path(blog.id)
        expect(response).to have_http_status(302)
      end
    end

    context 'When user logged in' do
      let(:user) { create(:user, :with_identity) }

      before do
        sign_in(user)
      end

      context 'When blog is written by user' do
        let(:blog) { create(:blog, author: user) }

        it 'is returned 200 OK' do
          get my_blog_path(blog.id)
          expect(response).to have_http_status(200)
        end
      end

      context 'When blog is written by other user' do
        let(:blog) { create(:blog, :with_author) }

        it 'is expected to raise record not found' do
          expect { get edit_my_blog_path(blog.id) }.to raise_error(ActiveRecord::RecordNotFound)
        end
      end
    end
  end

  describe 'GET /my/blogs/:id/edit' do
    let(:other_user_blog) { create(:blog, author) }

    context 'When user does not logged in' do
      let(:blog) { create(:blog, :with_author) }

      it 'is returned 302' do
        get edit_my_blog_path(blog.id)
        expect(response).to have_http_status(302)
      end
    end

    context 'When user logged in' do
      let(:user) { create(:user, :with_identity) }

      before do
        sign_in(user)
      end

      context 'When blog is written by user' do
        let(:blog) { create(:blog, author: user) }

        it 'is returned 200 OK' do
          get edit_my_blog_path(blog.id)
          expect(response).to have_http_status(200)
        end
      end

      context 'When blog is written by other user' do
        let(:blog) { create(:blog, :with_author) }

        it 'is expected to raise record not found' do
          expect { get edit_my_blog_path(blog.id) }.to raise_error(ActiveRecord::RecordNotFound)
        end
      end
    end
  end

  describe 'PATCH /my/blogs/:id' do
    let(:other_user_blog) { create(:blog, author) }

    context 'When user does not logged in' do
      let(:blog) { create(:blog, :with_author) }

      it 'is returned 302' do
        patch my_blog_path(blog.id)
        expect(response).to have_http_status(302)
      end
    end

    context 'When user logged in' do
      let(:user) { create(:user, :with_identity) }

      before do
        sign_in(user)
      end

      context 'When blog is written by user' do
        let(:blog) { create(:blog, author: user) }

        context 'With valid params' do
          let(:params) { { form_blog_contribution: { title: 'updated title', body: 'updated body' } } }

          it 'is returned 200 OK' do
            patch my_blog_path(blog.id), params: params
            expect(response).to have_http_status(200)
            body = response.body
            expect(body).to include 'updated title'
            expect(body).to include 'updated body'
          end
        end

        context 'With invalid params' do
          let(:params) { { form_blog_contribution: { title: '', body: 'updated body' } } }

          it 'is returned 200 OK' do
            patch my_blog_path(blog.id), params: params
            expect(response).to have_http_status(200)
            expect(response).to render_template(:edit)
          end
        end
      end

      context 'When blog is written by other user' do
        let(:blog) { create(:blog, :with_author) }

        it 'is expected to raise record not found' do
          expect { patch my_blog_path(blog.id) }.to raise_error(ActiveRecord::RecordNotFound)
        end
      end
    end
  end

  describe 'DELETE /my/blogs/:id' do
    let(:other_user_blog) { create(:blog, author) }

    context 'When user does not logged in' do
      let(:blog) { create(:blog, :with_author) }

      it 'is returned 302' do
        delete my_blog_path(blog.id)
        expect(response).to have_http_status(302)
      end
    end

    context 'When user logged in' do
      let(:user) { create(:user, :with_identity) }

      before do
        sign_in(user)
      end

      context 'When blog is written by user' do
        let(:blog) { create(:blog, author: user) }

        context 'With valid params' do
          it 'is returned 200 OK' do
            delete my_blog_path(blog.id)
            expect(response).to have_http_status(302)
            body = response.body
            expect { Blog.find(blog.id) }.to raise_error(ActiveRecord::RecordNotFound)
          end
        end
      end

      context 'When blog is written by other user' do
        let(:blog) { create(:blog, :with_author) }

        it 'is expected to raise record not found' do
          expect { delete my_blog_path(blog.id) }.to raise_error(ActiveRecord::RecordNotFound)
        end
      end
    end
  end
end
