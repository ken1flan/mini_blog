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

FactoryGirl.define do
  factory :user do
    nickname "MyString"
    icon_url "MyString"
    introduction "MyString"
  end
end
