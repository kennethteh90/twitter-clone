class UsersController < ApplicationController

  def index
    @users = User.where.not(id: current_user.id)
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.all
    # @tag = @user.posts.tags
  end

  def profile
    @post = Post.new
    @posts = current_user.posts.all.order("created_at DESC")
    @tag = @post.tags.new
    @user = current_user
  end

  def update
    if current_user.update(user_params)
      redirect_to profile_users_all_index_path
    else
      render :profile
    end
  end

  def remove
    current_user.avatar = nil
    current_user.save
    redirect_to profile_users_all_index_path
  end

  private

  def user_params
    params.require(:user).permit(:avatar)
  end

end
