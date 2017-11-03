class PostsController < ApplicationController

  before_action :authenticate_user!

  def index
    @post = Post.new
    @feed_items = current_user.feed.order("created_at DESC")
    # @tag = @post.tags.new

    search

  end

  def create
    @post = current_user.posts.new(post_params)
    if @post.save
      flash.discard
      flash.now[:notice] = 'Thanks for posting!'
      # Scan for hashtags
      @tag_array = @post.content.scan(/#\w+\b/)
      # Put loop here
      unless @tag_array == []
        @tag_array.each do |tag|
          @tag = Tag.find_or_initialize_by(name: tag)
          @tag.save
          @post.tags << @tag
          flash[:tag] = 'Hashtag added!'
        end
      end
      @post = Post.new
      @feed_items = current_user.feed.order("created_at DESC")
      search
    else
      @post = Post.new
      @feed_items = current_user.feed.order("created_at DESC")
      flash.now[:notice] = 'Empty tweet!'
    end


  end

  def new; end

  def show
    
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:notice] = 'Post deleted!'
    redirect_to profile_users_all_index_path
  end

  def edit
    @post = Post.find(params[:id])
  end

  # def update
  #   @post = Post.find(params[:id])
  #   @post.update(post_params)
  # end

  private

  def post_params
    params.require(:post).permit(:content, tags_attributes: [:name])
  end

  def search
    # Search
    params[:term].downcase! if params[:term]
    @user_id = User.find_by(username: params[:term])
    @results = if params[:term]
      (Post.where("content LIKE '%#{params[:term]}%'") + Post.where(user_id: @user_id)).reverse
    else
      @feed_items
    end
  end

end
