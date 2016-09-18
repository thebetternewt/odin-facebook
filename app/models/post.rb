class Post < ApplicationRecord
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  validates_presence_of [:content, :user_id]
  validates :content, length: { maximum: 500 }
end
