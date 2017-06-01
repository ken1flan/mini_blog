require 'rails_helper'

RSpec.describe "blogs/index", type: :view do
  before(:each) do
    assign(:blogs, [
      Blog.create!(
        :title => "MyText",
        :body => "MyText",
        :author_id => 2
      ),
      Blog.create!(
        :title => "MyText",
        :body => "MyText",
        :author_id => 2
      )
    ])
  end

  it "renders a list of blogs" do
    render
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
