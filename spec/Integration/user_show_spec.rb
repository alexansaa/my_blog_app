require 'rails_helper'

RSpec.describe 'User Page', type: :system do
  before do
    @user = FactoryBot.create(:user)
    @recent_posts = @user.most_recent_post
  end

  describe 'single user page' do
    it 'show the user info correctly' do
      visit user_path(@user)
      expect(page).to have_css("img[src='#{@user.photo}']")
      expect(page).to have_content(@user.name)
      expect(page).to have_content("Number of posts: #{@user.posts_counter}")
      expect(page).to have_content(@user.bio)
      @recent_posts.each do |post|
        expect(page).to have_content(post.text)
      end
      expect(page).to have_content('See all posts!')
    end

    it 'click on post redirect to show post page' do
      visit user_path(@user)
      @recent_posts.each do |post|
        find("a[href='/users/#{user.id}/posts/#{post.id}]").click
        expect(page).to have_current_path(user_post_path(@user, post))
      end
    end

    it 'click on see all post redirects to users post index page' do
      visit user_path(@user)
      find("a[href='/users/#{@user.id}/posts']").click
      expect(page).to have_current_path(user_posts_path(@user))
    end
  end
end
