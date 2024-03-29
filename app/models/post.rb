class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :likes

  after_save :update_post_counter

  validates :title, presence: true, length: { maximum: 250 }
  validates :comments_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :likes_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def most_recent_comments
    comments.order(created_at: :asc).limit(5)
  end

  def update_post_counter
    user.update(posts_counter: user.posts.count)
  end
end
