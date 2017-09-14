# frozen_string_literal: true

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
#  index_blog_tags_on_blog_id             (blog_id)
#  index_blog_tags_on_blog_id_and_tag_id  (blog_id,tag_id) UNIQUE
#  index_blog_tags_on_tag_id              (tag_id)
#

require 'rails_helper'

RSpec.describe BlogTag, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
