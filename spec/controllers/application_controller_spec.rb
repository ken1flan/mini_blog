# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ApplicationController, type: :controller do
  describe '#markdown_to_html' do
    it 'expect to convert markdown to html' do
      expect(subject.markdown_to_html('test')).to eq "<p>test</p>\n"
    end
  end
end
