require 'rails_helper'

RSpec.describe "users/index", type: :view do
  before(:each) do
    assign(:users, [
      User.create!(
        :nickname => "Nickname",
        :icon_url => "Icon Url",
        :introduction => "Introduction"
      ),
      User.create!(
        :nickname => "Nickname",
        :icon_url => "Icon Url",
        :introduction => "Introduction"
      )
    ])
  end

  it "renders a list of users" do
    render
    assert_select "tr>td", :text => "Nickname".to_s, :count => 2
    assert_select "tr>td", :text => "Icon Url".to_s, :count => 2
    assert_select "tr>td", :text => "Introduction".to_s, :count => 2
  end
end
