require 'rails_helper'
RSpec.describe 'User Single Post Page', type: :system do
  before do
    @user = FactoryBot.create(:user)
    @post = FactoryBot.create(:post, user: @user)
    @comment = FactoryBot.create(:comment, user: @user, post: @post)
    @like = FactoryBot.create(:like, user: @user, post: @post)
  end
  describe 'single user post page' do
    it 'show post info correctly' do
      visit user_post_path(@user, @post)
      expect(page).to have_content(@post.text)
    end
  end
end