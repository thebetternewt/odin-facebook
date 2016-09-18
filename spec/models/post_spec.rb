require 'rails_helper'

RSpec.describe Post, type: :model do

  let(:older_post) { create(:post) }
  let(:most_recent_post) { create(:post, created_at: Time.zone.now) }

  it "is invalid without content" do
    most_recent_post.content = nil
    expect(most_recent_post).to_not be_valid
  end

  it "is invalid without user_id" do
    most_recent_post.user = nil
    expect(most_recent_post).to_not be_valid
  end

  it "orders with most recent first" do
    expect(Post.all).to eq [most_recent_post, older_post]
  end

end
