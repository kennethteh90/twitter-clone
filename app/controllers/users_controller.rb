class UsersController < ApplicationController

  def index
    @users = User.all.where.not(id: current_user.id)
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.all
    # @tag = @user.posts.tags
  end

end
