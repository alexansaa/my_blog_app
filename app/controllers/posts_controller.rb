class PostsController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts.includes(:comments)
  end

  def show
    @current_user = current_user
    @user = User.includes(:posts).find(params[:user_id])
    @post = Post.find(params[:id])
    @comments = @post.comments
  end

  def new
    @user = current_user
    @post = Post.new
    respond_to do |format|
      format.html { render :new, locals: { post: @post, user: @user } }
    end
  end

  def create
    @user = current_user
    @new_post = @user.posts.new(params.require(:post).permit(:title, :text))
    @new_post.comments_counter = 0
    @new_post.likes_counter = 0

    respond_to do |format|
      if @new_post.save
        flash[:success] = 'Post saved successfully'
        # format.html { redirect_to user_posts_path(user_id: @user.id), notice: 'Post created' }
        format.js { render js: "window.location = '#{user_posts_path(user_id: @user.id)}';" }
      else
        flash.now[:error] = 'Error: Post could not be saved'
        flash.now[:error_details] = @new_post.errors.full_messages.join(', ')
        format.html { render :new, locals: { post: @new_post, user: @user } }
      end
    end
  end
end
