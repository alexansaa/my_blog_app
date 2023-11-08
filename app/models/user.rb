class User < ApplicationRecord
  has_many :comments
  has_many :posts
  has_many :likes

  validates :name, presence: true
  validates :posts_counter, numerically: { only_integer: true, greater_then_or_equal_to: 0 }

  def most_recent_post
    posts.order(created_at: :desc).limit(3)
  end  private
end
