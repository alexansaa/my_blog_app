class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts
  end

  def show
    @user = User.find(params[:user_id])
    @post = @user.posts.find(params[:id])
    @comments = @post.comments
  end

  def new
    @user = ApplicationController.current_user
    @post = Post.new
    respond_to do |format|
      format.html { render :new, locals: { post: @post, user: @user} }
    end
  end

  def create
    @user = ApplicationController.current_user
    @new_post = @user.posts.new(params.require(:post).permit(:title, :text))
    @new_post.comments_counter = 0
    @new_post.likes_counter = 0

    respond_to do |format|
      if @new_post.save
        flash[:success] = 'Post saved successfully'
        format.html { redirect_to user_posts_path(@user), notice: 'Post created' }
      else
        flash.now[:error] = 'Error: Post could not be saved'
        flash.now[:error_details] = @new_post.errors.full_messages.join(', ')
        format.html { render :new, locals: {post: @new_post, user: @user} }
      end
    end
  end
end
