class PostsController < ApplicationController
  def index
    @user = User.includes(posts: [:comments]).find(params[:user_id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.author = current_user
    respond_to do |format|
      if @post.save
        format.html { redirect_to user_posts_path(current_user.id), notice: 'Successfully created a post' }
      else
        flash[:error] = @post.errors.full_messages
        format.html { redirect_to new_user_post_path(current_user.id) }
      end
    end
  end

  def show
    @user = User.find(params[:user_id])
    @post = Post.find(params[:id])
    @post.comments.includes(:user)
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
