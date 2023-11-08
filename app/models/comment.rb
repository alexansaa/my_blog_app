class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  after_save :update_comment_counter

  def update_comment_counter(comments_count)
    post.update(comments_counter: comments_count)
  end
end
