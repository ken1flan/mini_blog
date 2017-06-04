require 'rails_helper'

RSpec.describe "blogs/show", type: :view do
  let(:author){ User.create(nickname: "NickName") }

  before(:each) do
    @blog = assign(:blog, Blog.create!(
      title: "MyTitle",
      body: "MyBody",
      author: author
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/MyTitle/)
    expect(rendered).to match(/MyBody/)
    expect(rendered).to match(/#{author.id}/)
  end
end
