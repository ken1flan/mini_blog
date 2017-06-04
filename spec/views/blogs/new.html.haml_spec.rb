require 'rails_helper'

RSpec.describe "blogs/new", type: :view do
  let(:author){ User.create(nickname: "NickName") }

  before(:each) do
    assign(:blog, Blog.new(
      title: "MyTitle",
      body: "MyBody",
      author: author
    ))
  end

  it "renders new blog form" do
    render

    assert_select "form[action=?][method=?]", blogs_path, "post" do

      assert_select "textarea[name=?]", "blog[title]"

      assert_select "textarea[name=?]", "blog[body]"

      assert_select "input[name=?]", "blog[author_id]"
    end
  end
end
