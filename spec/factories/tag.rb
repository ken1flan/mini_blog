# frozen_string_literal: true

# == Schema Information
#
# Table name: tags
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_tags_on_name  (name) UNIQUE
#

FactoryGirl.define do
  factory :tag do
    sequence(:name) { |n| "TagName#{n}" }
  end
end
