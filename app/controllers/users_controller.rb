class UsersController < ApplicationController
  def index; end
  def index
    @users = User.all
  end

  def show
    @id = params['id']
  end
end
