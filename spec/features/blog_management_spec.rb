require "rails_helper"

RSpec.feature "Blog management", :type => :feature do
  let(:user){ create(:user, :with_identity) }
  let!(:user_blog){ create(:blog, author: user) }
  let!(:user_draft_blog){ create(:blog, :draft, author: user) }
  let(:other_user){ create(:user, :with_identity) }
  let!(:other_user_blog){ create(:blog, author: other_user) }
  let!(:other_user_draft_blog){ create(:blog, :draft, author: other_user) }

  before do
    set_auth_mock(
      provider: user.identities.first.provider,
      nickname: user.nickname,
      uid: user.identities.first.uid
    )
  end

  after { unset_auth_mock(user.identities.first.provider) }

  scenario "User creates a new blog" do
    visit '/'
    click_link 'Sign In'

    click_link 'New Blog'
    fill_in 'Title', with: 'Blog Title'
    fill_in 'Body', with: 'Blog Body'
    click_button 'Save'

    expect(page).to have_content('Blog Title')
    expect(page).to have_content('Blog Body')
  end

  scenario "Unlogined user view blog list" do
    visit '/'

    expect(page).to have_content(user_blog.title)
    expect(page).not_to have_content(user_draft_blog.title)
    expect(page).to have_content(other_user_blog.title)
    expect(page).not_to have_content(other_user_draft_blog.title)
  end

  scenario "Logined user view blog list" do
    visit '/'
    click_link 'Sign In'

    expect(page).to have_content(user_blog.title)
    expect(page).not_to have_content(user_draft_blog.title)
    expect(page).to have_content(other_user_blog.title)
    expect(page).not_to have_content(other_user_draft_blog.title)

    click_link 'My Blogs'
    expect(page).to have_content(user_blog.title)
    expect(page).to have_content(user_draft_blog.title)
    expect(page).not_to have_content(other_user_blog.title)
    expect(page).not_to have_content(other_user_draft_blog.title)
  end

  scenario "User edits own blog" do
    visit '/'
    click_link 'Sign In'

    click_link 'My Blogs'
    click_link user_blog.title

    expect(page).to have_content(user_blog.title)
    expect(page).to have_content(user_blog.body)

    click_link 'Edit'

    fill_in 'Title', with: 'Blog New Title'
    fill_in 'Body', with: 'Blog New Body'
    click_button 'Save'

    expect(page).to have_content('Blog New Title')
    expect(page).to have_content('Blog New Body')
  end

  scenario "User destroys own blog" do
    visit '/'
    click_link 'Sign In'

    click_link 'My Blogs'
    click_link user_blog.title

    expect(page).to have_content(user_blog.title)
    expect(page).to have_content(user_blog.body)

    click_link 'Destroy'

    expect(page).not_to have_content(user_blog.title)
  end

  scenario "User visits other user's blog" do
    visit '/'
    click_link 'Sign In'

    click_link other_user_blog.title
    expect(page).not_to have_link('Edit')
    expect(page).not_to have_link('Destroy')
  end
end
