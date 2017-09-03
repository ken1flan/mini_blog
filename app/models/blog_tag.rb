# == Schema Information
#
# Table name: blog_tags
#
#  id         :integer          not null, primary key
#  blog_id    :integer
#  tag_id     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_blog_tags_on_blog_id  (blog_id)
#  index_blog_tags_on_tag_id   (tag_id)
#

class BlogTag < ApplicationRecord
  belongs_to :blog
  belongs_to :tag
end
