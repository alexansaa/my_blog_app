require 'rails_helper'

RSpec.describe 'User', type: :system do
  include Devise::Test::ControllerHelpers

  before do
    @users = User.all
    @user = FactoryBot.create(:user)
    @user.confirm
    sign_in @user
  end

  describe 'index page' do
    it 'shows all the users info correctly' do
      visit root_path
      @users.each do |user|
        expect(page).to have_content(user.name)
        expect(page).to have_css("img[src='#{user.photo}']")
        expect(page).to have_content("Number of posts: #{user.posts_counter}")
      end
    end

    it 'redirects to user show page on user element click' do
      visit root_path
      @users.each do |user|
        find("a.no_link[href='/users/#{user.id}']").click
        expect(page).to have_current_path(user_path(user))
        expect(page).to have_content(user.name)
        expect(page).to have_content(user.bio)
        visit root_path
      end
    end
  end
end
