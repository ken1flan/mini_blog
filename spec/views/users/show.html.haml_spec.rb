require 'rails_helper'

RSpec.describe "users/show", type: :view do
  before(:each) do
    @user = assign(:user, User.create!(
      :nickname => "Nickname",
      :icon_url => "Icon Url",
      :introduction => "Introduction"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Nickname/)
    expect(rendered).to match(/Icon Url/)
    expect(rendered).to match(/Introduction/)
  end
end
