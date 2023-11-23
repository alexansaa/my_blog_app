require 'rails_helper'

RSpec.describe 'User Post Index page', type: :system do
  before do
    @user = FactoryBot.create(:user)
    @posts = @user.posts
  end

  describe 'posts from user page' do
    it 'show the users posts correctly' do
      visit user_posts_path(@user)
      expect(page).to have_css("img[src*='#{@user.photo}']")
      expect(page).to have_content(@user.name)
      expect(page).to have_content("Number of posts: #{@user.posts_counter}")
      @posts.each do |post|
        expect(page).to have_content(post.title)
        expect(page).to have_content(post.text)
        post.most_recent_comments.each do |comment|
          expect(page).to have_content(comment.text)
          expect(page).to have_content("Comments: #{post.comments_counter}")
          expect(page).to have_content("Likes: #{post.likes_counter}")
        end
      end
      expect(page).to have_content('Pagination')
    end

    it 'redirect to a single post show page on post click' do
      visit user_posts_path(@user)
      @posts.each do |post|
        find("a.no_link[href='/users/#{@user.id}/posts/#{post.id}]").click
        expect(page).to have_current_path(user_post_path(@user, post))
      end
    end
  end
end
