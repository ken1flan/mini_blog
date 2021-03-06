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

FactoryBot.define do
  factory :user do
    sequence(:nickname) { |n| "Nickname#{n}" }
    icon_url { nil }
    introduction { nil }

    trait :with_identity do
      after(:create) do |user|
        create(:identity, user: user)
      end
    end
  end
end
