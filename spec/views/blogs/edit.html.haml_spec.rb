require 'rails_helper'

RSpec.describe "blogs/edit", type: :view do
  let(:author){ User.create(nickname: "NickName") }
  before(:each) do
    @blog = assign(:blog, Blog.create!(
      title: "MyTitle",
      body: "MyBody",
      author: author
    ))
  end

  it "renders the edit blog form" do
    render

    assert_select "form[action=?][method=?]", blog_path(@blog), "post" do

      assert_select "textarea[name=?]", "blog[title]"

      assert_select "textarea[name=?]", "blog[body]"

      assert_select "input[name=?]", "blog[author_id]"
    end
  end
end
