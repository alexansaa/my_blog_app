class User < ApplicationRecord
  has_many :comments
  has_many :posts
  has_many :likes

  def self.most_recent_post(user_id, limit = 3)
    my_user = User.find(user_id)
    if my_user.nil?
      puts 'User not found'
      return
    end
    my_posts = my_user.posts.order(created_at: :desc).limit(limit)
    my_posts.each do |p|
      puts "#{p.title} #{p.text}"
    end
    my_posts
  end
end
