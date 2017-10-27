class PostsController < ApplicationController

  before_action :authenticate_user!

  def index
    @post = Post.new
    @feed_items = current_user.feed.order("created_at DESC")
    @tag = @post.tags.new
  end

  def create
    @post = current_user.posts.new(post_params)
    if @post.save
      flash[:posted] = 'Thanks for posting!'
      redirect_to posts_path
    else
      @post = Post.new
      @posts = current_user.posts.all.order("created_at DESC")
      render :index
    end
  end

  def new; end

  def show; end

  def destroy
    Post.destroy(params[:id])
    flash[:deleted] = 'Post deleted!'
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:content)
  end

end
