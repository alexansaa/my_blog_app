class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post
  def self.update_counter(post_id, comments_count)
    myPost = Post.find(post_id)
    if myPost.nil?
      puts 'Post not found'
      return
    end
    myPost.update(comments_counter: comments_count)
  end
end
