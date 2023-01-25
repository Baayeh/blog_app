class CommentsController < ApplicationController
  def create
    @user = Post.find(params[:user_id])
    @post = Post.find(params[:post_id])
    @comment = Comment.new(comment_params)
    @comment.author = current_user
    @comment.post = @post
    
    if @comment.save
      redirect_to user_post_path(@user, @post), notice: "Successfully added a comment"
    else
      flash.now[:error] = @comment.errors.full_messages
      redirect_to user_post_path(@user, @post)
    end
  end

  def comment_params
    params.require(:comment).permit(:text)
  end
end