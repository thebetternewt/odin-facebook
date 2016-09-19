require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  it "should redirect create if not signed in" do
    user = create(:user)
    user.posts.create(content: Faker::StarWars.quote )

    expect(subject.current_user).to be(nil)
    post :create, params: { content: Faker::StarWars.quote, user: user }

    expect(subject).to redirect_to(new_user_session_url)
  end

  it "should redirect destroy if not signed in" do
    user = create(:user)
    user.posts.create(content: Faker::StarWars.quote )

    expect(subject.current_user).to be(nil)

    delete :destroy, params: { id: user.posts.first.id }
    expect(subject).to redirect_to(new_user_session_url)
  end
end
