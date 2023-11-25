module Api
  class UsersController < Api::BaseController
    before_action :authenticate_user!, except: [:create]
  
    def index
      @users = User.all
      @user = current_user
    end
  
    def show
      @user = User.find(params[:id])
      @posts = @user.most_recent_post
    end

    def create
      @user = User.new(user_params)

      if @user.save
        render json: @user, status: :created
      else
        render json: @user.errors, status: :unprocessable_entity
      end
    end

    private

    def user_params
      params.require(:user).permit(:name, :email, :password)
    end
  end
end
