# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Blog, type: :model do
  describe '#save' do
    subject { blog_contribution.save }

    let(:author) { create(:user) }
    let(:blog) { create(:blog, author: author) }
    let(:tags_string) { '' }
    let(:blog_contribution) do
      Form::BlogContribution.new(
        title: 'title123',
        body: 'body123',
        status: 'published',
        tags_string: tags_string,
        author: author,
        blog: blog
      )
    end

    context 'When blog is saved' do
      let!(:blog) { create(:blog, author: author) }

      it 'is expected to update blog' do
        expect(Blog.count).to eql 1
        subject
        expect(Blog.count).to eql 1
        saved_blog = Blog.first
        expect(saved_blog.title).to eql blog_contribution.title
        expect(saved_blog.body).to eql blog_contribution.body
        expect(saved_blog.status).to eql blog_contribution.status
      end
    end

    context 'When blog is not saved' do
      let!(:blog) { build(:blog, author: author) }

      it 'is expected to update blog' do
        expect(Blog.count).to eql 0
        subject
        expect(Blog.count).to eql 1
        saved_blog = Blog.first
        expect(saved_blog.title).to eql blog_contribution.title
        expect(saved_blog.body).to eql blog_contribution.body
        expect(saved_blog.status).to eql blog_contribution.status
      end
    end

    context 'With tag is not saved' do
      let(:tags_string) { 'tag1' }

      it 'is expected to create tag' do
        expect(Tag.count).to eql 0
        subject
        expect(Tag.count).to eql 1

        saved_blog = Blog.first
        expect(saved_blog.tags.first.name).to eql 'tag1'
      end
    end

    context 'With tag is saved' do
      let!(:tag) { create(:tag) }
      let(:tags_string) { tag.name }

      it 'is expected not to create tag' do
        expect(Tag.count).to eql 1
        subject
        expect(Tag.count).to eql 1

        saved_blog = Blog.first
        expect(saved_blog.tags.first).to eql tag
      end
    end

    context 'With 3 tags' do
      let(:tags_string) { ' tag1,tag2, tag3' }

      it 'is expected not to create tag' do
        subject

        saved_blog = Blog.first
        tag_names = saved_blog.tags.map(&:name)
        expect(tag_names).to include 'tag1'
        expect(tag_names).to include 'tag2'
        expect(tag_names).to include 'tag3'
      end
    end
  end

  describe '.build_from' do
    subject { Form::BlogContribution.build_from(original) }

    context 'When original is nil' do
      let(:original) { nil }

      it 'is expected to raise error' do
        expect { subject }.to raise_error
      end
    end

    context 'When original without tags exists' do
      let(:original) { create(:blog, :with_author) }

      it 'is expected to attributes are equal to blog attributes' do
        expect(subject.title).to eql original.title
        expect(subject.body).to eql original.body
        expect(subject.status).to eql original.status
        expect(subject.blog).to eql original
        expect(subject.blog).to eql original
        expect(subject.author).to eql original.author
        expect(subject.tags_string).to be_empty
      end
    end

    context 'When original with tags exists' do
      let(:tags) { create_list(:tag, 3) }
      let(:original) { create(:blog, :with_author, :tagged, tags: tags) }

      it 'is expected to attributes are equal to blog attributes' do
        expect(subject.title).to eql original.title
        expect(subject.body).to eql original.body
        expect(subject.status).to eql original.status
        expect(subject.blog).to eql original
        expect(subject.blog).to eql original
        expect(subject.author).to eql original.author
        expect(subject.tags_string).to eql tags.map(&:name).join(',')
      end
    end
  end
end
