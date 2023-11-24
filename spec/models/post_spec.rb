require 'rails_helper'

RSpec.describe Post, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @posts = []
    @posts[0] = FactoryBot.create(:post, user: @user)
    @posts[1] = FactoryBot.create(:post, user: @user)
    @posts[2] = FactoryBot.create(:post, user: @user)
    @posts[3] = FactoryBot.create(:post, user: @user)
    @posts[4] = FactoryBot.create(:post, user: @user)
    @posts[5] = FactoryBot.create(:post, user: @user)
    @posts[6] = FactoryBot.create(:post, user: @user)
  end

  describe 'data verification' do
    it 'title should be present' do
      expect(@posts[0]).to have_attributes(title: anything)
    end

    it 'comments_counter should be positive or zero' do
      expect(@posts[0].comments_counter).to be >= 0
    end

    it 'likes_counter should be positive or zero' do
      expect(@posts[0].likes_counter).to be >= 0
    end

    it 'check the corectness of the post counter after a user creates a post' do
      expect(@user.posts_counter).to eq(7)
    end

    it 'returns the 3 most recent posts, even if there are more' do
      most_recent_post = @user.most_recent_post.to_a
      expect(most_recent_post).to eq([@posts[0], @posts[1], @posts[2]])
    end
  end
end
