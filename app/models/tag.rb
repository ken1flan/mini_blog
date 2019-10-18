# frozen_string_literal: true

# == Schema Information
#
# Table name: tags
#
#  id         :bigint(8)        not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_tags_on_name  (name) UNIQUE
#

class Tag < ApplicationRecord
  has_many :blog_tags
  has_many :blogs, through: :blog_tags

  validates :name, presence: true, uniqueness: true
end
