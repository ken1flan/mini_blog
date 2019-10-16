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

RSpec.describe BlogsController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/blogs').to route_to('blogs#index')
    end

    it 'routes to #show' do
      expect(get: '/blogs/1').to route_to('blogs#show', id: '1')
    end
  end
end
