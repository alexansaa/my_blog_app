class UsersController < ApplicationController
  def index
    # shows index view
  end

  def show
    @user_id = params[:id]
  end
end
