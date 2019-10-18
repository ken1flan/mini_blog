# frozen_string_literal: true

# == Schema Information
#
# Table name: blog_tags
#
#  id         :bigint(8)        not null, primary key
#  blog_id    :bigint(8)
#  tag_id     :bigint(8)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_blog_tags_on_blog_id             (blog_id)
#  index_blog_tags_on_blog_id_and_tag_id  (blog_id,tag_id) UNIQUE
#  index_blog_tags_on_tag_id              (tag_id)
#

class BlogTag < ApplicationRecord
  belongs_to :blog
  belongs_to :tag
end
