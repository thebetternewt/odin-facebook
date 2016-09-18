require 'rails_helper'

RSpec.describe "users/show", :type => :view do

  it "renders posts for user" do
    @user = create(:user)
    assign(:user, @user)
    content = Faker::StarWars.quote
    @user.posts.create(content: content)
    render
    expect(rendered).to have_content(content)
  end
end
