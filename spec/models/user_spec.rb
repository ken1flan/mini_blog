# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id           :bigint(8)        not null, primary key
#  nickname     :string(64)       not null
#  icon_url     :string
#  introduction :text
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#editable?' do
    subject { user.editable?(editor) }
    let(:user) { create(:user) }
    let(:another_user) { create(:user) }

    context 'When editor = user' do
      let(:editor) { user }

      it { is_expected.to be_truthy }
    end

    context 'When editor = another_user' do
      let(:editor) { another_user }

      it { is_expected.to be_falsy }
    end

    context 'When editor = nil' do
      let(:editor) { nil }

      it { is_expected.to be_falsy }
    end
  end

  describe '.create_with_identity' do
    subject(:user) { User.create_with_identity(auth) }

    context 'When auth is valid' do
      let(:auth) { { info: { nickname: 'somebody' }, provider: 'twitter', uid: '12345678' } }

      it 'expects user create with identity' do
        created_user = User.find(user.id)
        identity = created_user.identities.first
        expect(created_user.nickname).to eql(auth[:info][:nickname])
        expect(identity.provider).to eql(auth[:provider])
        expect(identity.uid).to eql(auth[:uid])
      end
    end

    context 'When auth is nil' do
      let(:auth) { nil }

      it 'is expected to raise error' do
        expect { subject }.to raise_error NoMethodError
      end
    end

    context 'When invalid auth' do
      let(:auth) { { invalid: 'test' } }

      it 'is expected to raise error' do
        expect { subject }.to raise_error NoMethodError
      end
    end
  end

  describe '.find_from' do
    subject(:user) { User.find_from(auth) }
    let(:auth) { { info: { nickname: 'somebody' }, provider: 'twitter', uid: '12345678' } }

    context 'When user does not exist' do
      it { is_expected.to be_nil }
    end

    context 'When user exist' do
      before { User.create_with_identity(auth) }
      it 'expects to find user' do
        identity = user.identities.first
        expect(identity.provider).to eql(auth[:provider])
        expect(identity.uid).to eql(auth[:uid])
      end
    end
  end
end
