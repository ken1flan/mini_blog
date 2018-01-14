# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id           :integer          not null, primary key
#  nickname     :string(64)       not null
#  icon_url     :string
#  introduction :text
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

FactoryBot.define do
  factory :user do
    sequence :nickname do |n|
      "Nickname#{n}"
    end
    icon_url nil
    introduction nil

    trait :with_identity do
      after(:create) do |user|
        create(:identity, user: user)
      end
    end
  end
end
