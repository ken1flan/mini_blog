require 'rails_helper'

RSpec.feature 'Tags', type: :feature do
  let(:tags) { create_list(:tag, 3) }
  let(:tagged_blogs) { create_list(:blog, 3, :with_author, :tagged, tags: tags) }
  let(:non_tagged_blogs) { create_list(:blog, 3, :with_author) }
  background do
    tagged_blogs
  end

  scenario 'User visits tags page' do
    visit tags_path
    tags.each do |tag|
      expect(page.text).to include(tag.name)
    end

    first_tag = tags.first
    click_link first_tag.name
    expect(page.text).to include(first_tag.name)
    tagged_blogs.each do |blog|
      expect(page.text).to include(blog.title)
    end
    non_tagged_blogs.each do |blog|
      expect(page.text).not_to include(blog.title)
    end
  end
end
