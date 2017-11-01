class TagsController < ApplicationController

  before_action :authenticate_user!

  def index
    @tags = Tag.all
  end

  def create
    @post = Post.find(tag_params[:post_id])
    @tag = Tag.find_or_initialize_by(name: tag_params[:name])
    if @post.tags.exists?({name: @tag.name})
      flash[:tag_exists] = 'Hashtag exists!'
      redirect_to posts_path
    elsif @tag.save
      @post.tags << @tag
      flash[:tag_created] = 'Hashtag added!'
      redirect_to posts_path
    else
      flash[:tag_failed] = 'Hashtag did not work!'
      redirect_to posts_path
    end
  end

  def destroy
    # @post = Post.find(params[:post_id])
    # @post.tags.destroy(params[:id])
    Tag.destroy(params[:id])
    flash[:tag_deleted] = 'Hashtag deleted!'
    redirect_to profile_users_all_index_path
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
