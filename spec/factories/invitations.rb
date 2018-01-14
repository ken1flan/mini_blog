# frozen_string_literal: true

# == Schema Information
#
# Table name: invitations
#
#  id            :integer          not null, primary key
#  email         :string(256)      not null
#  message       :text             not null
#  introducer_id :integer          not null
#  token         :string           not null
#  expired_at    :datetime         not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
# Indexes
#
#  index_invitations_on_introducer_id  (introducer_id)
#

FactoryBot.define do
  factory :invitation do
    email 'foo@bar.com'
    message 'Welcome!'
    introducer_id 1
    token nil
    expired_at nil

    trait :with_introducer do
      after(:build) do |invitation|
        introducer = create(:user)
        invitation.introducer = introducer
      end
    end

    trait :expired do
      expired_at 1.day.ago
    end
  end
end
