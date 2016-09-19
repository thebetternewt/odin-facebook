require 'rails_helper'

RSpec.describe "users/show", :type => :feature do

  it "renders posts for user" do
    @user = create(:user)
    content = Faker::StarWars.quote
    @user.posts.create(content: content)
    visit user_path(@user)
    expect(page).to have_content(content)
  end

  it "creates and updates page with new post via post form" do
    @user = create(:user)
    content = Faker::StarWars.quote

    sign_in @user
    visit user_path(@user)
    fill_in "post_content", with: content
    click_button "Post"

    expect(page).to have_content(content)

  end
end
