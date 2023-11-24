require 'rails_helper'

RSpec.describe Comment, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @post = FactoryBot.create(:post, user: @user)
    @comment = FactoryBot.create(:comment, user: @user, post: @post)
  end

  describe 'updates' do
    it 'counter verification' do
      expect(@post.comments_counter).to eq(1)
    end
  end
end
