require 'rails_helper'

RSpec.describe "blogs/index", type: :view do
  let(:author){ User.create(nickname: "NickName") }
  before(:each) do
    assign(:blogs, [
      Blog.create!(
        title: "MyTitle",
        body: "MyBody",
        author: author
      ),
      Blog.create!(
        title: "MyTitle",
        body: "MyBody",
        author: author
      )
    ])
  end

  it "renders a list of blogs" do
    render
    assert_select "tr>td", :text => "MyTitle".to_s, :count => 2
    assert_select "tr>td", :text => author.id.to_s, :count => 2
  end
end
