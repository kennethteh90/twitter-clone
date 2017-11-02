class TagsController < ApplicationController

  before_action :authenticate_user!

  def index
    @tags = Tag.all
  end

  def show
    @tag = Tag.find(params[:id])
    @posts = @tag.posts.all.order("created_at DESC")
  end

  private

  def tag_params
    params.require(:tag).permit(:name, :post_id)
  end

end
