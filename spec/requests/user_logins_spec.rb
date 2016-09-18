require 'rails_helper'

RSpec.describe "UserLogins", type: :feature do
  it "gets current user show page following successful login" do
    user = create(:user)
    visit new_user_session_path
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password

    click_button "Login"

    expect(page).to have_current_path(user_path(user))
  end
end
