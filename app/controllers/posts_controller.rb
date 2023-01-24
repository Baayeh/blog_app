class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @user_posts = @user.posts
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.new(post_params)
    if @post.save
      redirect_to user_posts_path(current_user), notice: "Successfully created a post"
    else
      flash.now[:error] = @post.errors.full_messages
      redirect_to new_user_post_path(current_user)
    end
  end

  def post_params
    params.require(:post).permit(:title, :text)
  end

  def show
    @post = Post.find(params[:id])
  end
end
