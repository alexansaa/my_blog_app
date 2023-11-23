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
      expect(page).to have_content(@post.title)
      expect(page).to have_content(@post.text)
      expect(page).to have_content(@post.user.name)
      expect(page).to have_content("Comments: #{@post.comments_counter}")
      expect(page).to have_content("Likes: #{@post.likes_counter}")

      @post.comments.each do |cmnt|
        expect(page).to have_content(cmnt.user.name)
        expect(page).to have_content(cmnt.text)
      end
    end
  end
end
