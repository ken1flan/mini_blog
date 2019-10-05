# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'My', type: :request do
  describe 'GET /my' do
    it 'works!' do
      get my_index_path
      expect(response).to have_http_status(200)
    end
  end
end
