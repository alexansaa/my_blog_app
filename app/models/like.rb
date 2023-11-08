class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post
  def self.update_counter(post_id, likes_count)
    my_post = Post.find(post_id)
    if my_post.nil?
      puts 'Post not found'
      return
    end
    my_post.update(likes_counter: likes_count)
  end
end
