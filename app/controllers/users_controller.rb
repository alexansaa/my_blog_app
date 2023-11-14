class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts
    puts "@user: #{@user.inspect}"
    puts "@posts: #{@posts.inspect}"
  end
end
