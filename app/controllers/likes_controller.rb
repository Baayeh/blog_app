class LikesController < ApplicationController
  def create
    @user = Post.find(params[:user_id])
    @post = Post.find(params[:post_id])
    @like = Like.new
    @like.author = current_user
    @like.post = @post

    if @like.save
      redirect_to user_post_path(@user, @post), notice: "You have liked this post"
    else
      flash[:error] = @like.errors.full_messages
      redirect_to user_post_path(@user, @post)
    end
  end
end