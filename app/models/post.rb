class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :likes

  after_save :update_post_counter

  def most_recent_comments
    comments.order(created_at: :desc).limit(5)
  end

  def update_post_counter(post_count)
    user.update(posts_counter: post_count)
  end
end
