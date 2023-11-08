class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :likes

  def self.update_counter(user_id, post_count)
    myUser = User.find(user_id)
    if myUser.nil?
      puts 'User not found'
      return
    end
    myUser.update(posts_counter: post_count)
  end

  def self.most_recent_comments(post_id, limit = 5)
    myPost = Post.find(post_id)
    if myPost.nil?
      puts 'Post not found'
      return
    end
    myComments = myPost.comments.order(created_at: :desc).limit(limit)
    myComments.each do |c|
      puts "#{c.user} #{c.text}"
    end
    return myComments
  end
end
