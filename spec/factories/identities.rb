# == Schema Information
#
# Table name: identities
#
#  id         :integer          not null, primary key
#  user_id    :integer          not null
#  provider   :string(64)       not null
#  uid        :string(64)       not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryGirl.define do
  factory :identity do
    user_id 1
    provider "MyString"
    uid "MyString"
  end
end
