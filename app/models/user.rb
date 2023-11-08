class User < ApplicationRecord
  has_many :comments
  has_many :posts
  has_many :likes

  def self.most_recent_post(user_id, limit = 3)
    myUser = User.find(user_id)
    if myUser.nil?
      puts 'User not found'
      return
    end
    myPosts = myUser.posts.order(created_at: :desc).limit(limit)
    myPosts.each do |p|
      puts "#{p.title} #{p.text}"
    end
    return myPosts
  end
end
