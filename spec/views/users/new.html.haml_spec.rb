require 'rails_helper'

RSpec.describe "users/new", type: :view do
  before(:each) do
    assign(:user, User.new(
      :nickname => "MyString",
      :icon_url => "MyString",
      :introduction => "MyString"
    ))
  end

  it "renders new user form" do
    render

    assert_select "form[action=?][method=?]", users_path, "post" do

      assert_select "input[name=?]", "user[nickname]"

      assert_select "input[name=?]", "user[icon_url]"

      assert_select "input[name=?]", "user[introduction]"
    end
  end
end
