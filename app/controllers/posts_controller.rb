class PostsController < ApplicationController

  def index
    @post = Post.new
    @posts = Post.all
    # @tags = @post.tags.all
    # @tag = @post.tags.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:posted] = "Thanks for posting!"
      redirect_to posts_path
    else
      @post = Post.new
      @posts = Post.all
      render :index
    end
  end

  def new; end

  def show

  end

  def destroy
    Post.destroy(params[:id])
    flash[:deleted] = "Post deleted!"
    redirect_to posts_path
  end

  private

    def post_params
      params.require(:post).permit(:content)
    end

end
