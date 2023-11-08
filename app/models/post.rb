class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :likes

  def self.update_counter(user_id, post_count)
    my_user = User.find(user_id)
    if my_user.nil?
      puts 'User not found'
      return
    end
    my_user.update(posts_counter: post_count)
  end

  def self.most_recent_comments(post_id, limit = 5)
    my_post = Post.find(post_id)
    if my_post.nil?
      puts 'Post not found'
      return
    end
    my_comments = my_post.comments.order(created_at: :desc).limit(limit)
    my_comments.each do |c|
      puts "#{c.user} #{c.text}"
    end
    my_comments
  end
end
