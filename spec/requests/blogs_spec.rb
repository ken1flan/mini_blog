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

require 'rails_helper'

RSpec.describe 'Blogs', type: :request do
  describe 'GET /blogs' do
    it 'works! (now write some real specs)' do
      get blogs_path
      expect(response).to have_http_status(200)
    end
  end
end
