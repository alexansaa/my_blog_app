require 'rails_helper'

RSpec.describe Like, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @post = FactoryBot.create(:post, user: @user)
    @like = FactoryBot.create(:like, user: @user, post: @post)
  end

  describe 'updates' do
    it 'likes counter verification' do
      expect(@post.likes_counter).to eq(1)
    end
  end
end
