class CommentsController < ApplicationController
  def new
    @user = ApplicationController.current_user
    @post = Post.find(params[:post_id])
    @comment = Comment.new(post: @post)
    respond_to do |format|
      format.html { render :new, locals: { comment: @comment, user: @user, post: @post } }
    end
  end

  def create
    @user = ApplicationController.current_user
    @post = @user.posts.find(params[:post_id])
    @new_comment = @post.comments.new(params.require(:comment).permit(:text))
    @new_comment.user = @user

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
end
