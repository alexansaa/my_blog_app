class UsersController < ApplicationController
  def index
    # shows index view
  end

  def user
    @user_id = params[:id]
  end

  def posts
    @user_id = params[:id]
  end

  def post
    @user_id = params[:id]
    @post_id = params[:p_id]
  end
end