class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @user_posts = @user.posts
  end

  def show
    @id = params['id']
  end
end
