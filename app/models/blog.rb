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
#  status     :integer
#
# Indexes
#
#  index_blogs_on_author_id  (author_id)
#

class Blog < ApplicationRecord
  belongs_to :author, class_name: 'User'

  enum status: { draft: 0, published: 1 }

  def editable? (user)
    author == user
  end
end
