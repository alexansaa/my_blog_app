class LikesController < ApplicationController
  def create
    @user = ApplicationController.current_user
    @post = Post.find(params[:post_id])
    @new_like = @post.likes.new(user: @user)

    respond_to do |format|
      if @new_like.save
        flash[:success] = 'Like saved successfully'
        format.js { render js: "window.location = '#{user_post_path(@user, @post)}';"}
      else
        puts 'like not created'
        puts @new_like.errors.full_messages.join(', ')
        flash.now[:error] = 'Error: Like could not be created'
        flash.now[:error_details] = @new_like.errors.full_messages.join(', ')
        format.js { render js: "console.error('Error: Like could not be created');" }
      end
    end

  end
end