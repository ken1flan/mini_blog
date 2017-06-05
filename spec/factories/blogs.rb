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
#
# Indexes
#
#  index_blogs_on_author_id  (author_id)
#

FactoryGirl.define do
  factory :blog do
    title "MyText"
    body "MyText"
    author_id 1
  end
end
