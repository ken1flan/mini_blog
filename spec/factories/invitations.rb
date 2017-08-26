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

FactoryGirl.define do
  factory :invitation do
    email "MyString"
    message "MyText"
    introducer_id 1
    token "MyString"
    expired_at "2017-08-24 08:20:04"

    trait :with_introducer do
      after(:build) do |invitation|
        introducer = create(:user)
        invitation.introducer = introducer
      end
    end
  end
end
