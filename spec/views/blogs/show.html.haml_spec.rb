require 'rails_helper'

RSpec.describe "blogs/show", type: :view do
  before(:each) do
    @blog = assign(:blog, Blog.create!(
      :title => "MyText",
      :body => "MyText",
      :author_id => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/2/)
  end
end
