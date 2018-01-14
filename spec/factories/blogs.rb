# frozen_string_literal: true

# == Schema Information
#
# Table name: blogs
#
#  id         :integer          not null, primary key
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

FactoryBot.define do
  factory :blog do
    sequence(:title) { |n| "title#{n}" }
    sequence(:body) { |n| "body#{n}" }
    status Blog.statuses[:published]
    author_id 1

    trait :draft do
      status Blog.statuses[:draft]
    end

    trait :with_author do
      before(:create) do |blog|
        blog.author = create(:user)
      end
    end

    trait :tagged do
      transient do
        tags []
      end

      after(:create) do |blog, evaluator|
        blog.tags = evaluator.tags
      end
    end
  end
end
