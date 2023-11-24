class CommentsController < ApplicationController
  before_action :configure_permitted_parameters, if: :devise_controller?

  def new
    @user = User.includes(:posts).find(params[:user_id])
    @post = @user.posts.find(params[:post_id])
    @comment = Comment.new(post: @post)
    respond_to do |format|
      format.html { render :new, locals: { comment: @comment, user: @user, post: @post } }
    end
  end

  def create
    @user = User.includes(:posts).find(params[:user_id])
    @post = @user.posts.find(params[:post_id])
    @new_comment = @post.comments.new(params.require(:comment).permit(:text))
    @new_comment.user = current_user

    respond_to do |format|
      if @new_comment.save
        flash[:success] = 'Comment saved suvvessfully'
        # format.html { redirect_to user_post_path(@user, @post), notice: 'Comment created' }
        format.js { render js: "window.location = '#{user_post_path(@user, @post)}';" }
      else
        flash.now[:error] = 'Error: Comment could not be saved'
        flash.now[:error_details] = @new_comment.errors.full_messages.join(', ')
        format.html { render :new, locals: { comment: @new_comment, user: @user, post: @post } }
      end
    end
  end

  def destroy
    @user = User.includes(:posts).find(params[:user_id])
    @post = @user.posts.includes(:comments).find(params[:post_id])
    @commnet = @post.comments.find(params[:id])

    respond_to do |format|
      if @commnet.destroy
        flash[:success] = 'Comment deleted succesfully'
        puts 'Comment deleted succesfully'
        format.js { render js: "window.location = '#{user_post_path(user_id: @user.id, id: @post.id)}';" }
      else
        flash.now[:error] = 'Error: Comment could not be deleted'
        flash.now[:error_details] = @post.errors.full_messages.join(',')
        puts 'Error: Comment could not be deleted'
        format.js { render js: "window.location = '#{user_post_path(user_id: @user.id, id: @post.id)}';" }
      end
    end
  end
end
