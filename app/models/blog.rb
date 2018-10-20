# frozen_string_literal: true
# == Schema Information
#
# Table name: blogs
#
#  id         :bigint(8)        not null, primary key
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

class Blog < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :blog_tags, dependent: :destroy
  has_many :tags, through: :blog_tags

  validates :title, presence: true, length: { maximum: 64 }
  validates :body, presence: true, length: { maximum: 10_000 }
  enum status: { draft: 0, published: 1 }

  scope :normal_order, -> { order('blogs.created_at DESC') }

  def editable?(user)
    author == user
  end
end
