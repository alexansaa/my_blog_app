class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post
  def self.update_counter(post_id, likes_count)
    myPost = Post.find(post_id)
    if myPost.nil?
      puts 'Post not found'
      return
    end
    myPost.update(likes_counter: likes_count)
  end
end
