class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post
  def self.update_counter(post_id, comments_count)
    my_post = Post.find(post_id)
    if my_post.nil?
      puts 'Post not found'
      return
    end
    my_post.update(comments_counter: comments_count)
  end
end
