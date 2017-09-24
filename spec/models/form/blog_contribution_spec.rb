# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Blog, type: :model do
  describe '.build_from' do
    subject { Form::BlogContribution.build_from(original) }

    context 'When original is nil' do
      let(:original){ nil }

      it 'is expected to raise error' do
        expect { subject }.to raise_error
      end
    end

    context 'When original without tags exists' do
      let(:original){ create(:blog, :with_author) }

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
      let(:tags){ create_list(:tag, 3) }
      let(:original){ create(:blog, :with_author, :tagged, tags: tags) }

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