class User < ApplicationRecord
  before_validation :set_default_values, on: :create

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  has_many :comments
  has_many :posts
  has_many :likes

  validates :name, presence: true
  validates :posts_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def most_recent_post
    posts.order(created_at: :asc).limit(3)
  end

  private

  def set_default_values
    self.posts_counter = 0
  end
end
