class RelationshipsController < ApplicationController

  def create
    user = User.find(params[:followed_id])
    if user == current_user
      flash[:failure] = "You are trying to follow yourself!"
      redirect_to users_all_index_path
    else
      current_user.follow(user)
      flash[:success] = "You are now following @#{user.username}"
      redirect_to users_all_index_path
    end
  end

  def destroy
    user = Relationship.find(params[:id]).followed
    current_user.unfollow(user)
    flash[:success] = "You are no longer following @#{user.username}"
    redirect_to users_all_index_path
  end

end
