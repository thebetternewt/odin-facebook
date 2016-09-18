require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { create(:user) }

  it "should destroy associated posts when user is destroyed" do
    expect(user.posts.count).to eq(0)
    post = user.posts.create(content: Faker::StarWars.quote)
    expect(Post.first).to eq(post)
    user.destroy
    expect(Post.first).to eq(nil)
  end
end
