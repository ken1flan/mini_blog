# frozen_string_literal: true
# == Schema Information
#
# Table name: blogs
#
#  id         :bigint(8)        not null, primary key
#  title      :string           not null
#  body       :text             not null
#  author_id  :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  status     :integer          default("draft"), not null
#
# Indexes
#
#  index_blogs_on_author_id  (author_id)
#

require 'rails_helper'

RSpec.describe Blog, type: :model do
  describe '#editable?' do
    subject { blog.editable?(user) }

    let(:author) { create(:user) }
    let(:no_author) { create(:user) }
    let(:blog) { create(:blog, author: author) }

    context 'When user is blog owner' do
      let(:user) { author }

      it { is_expected.to be_truthy }
    end

    context 'When user is not blog owner' do
      let(:user) { no_author }

      it { is_expected.to be_falsy }
    end
  end
end
