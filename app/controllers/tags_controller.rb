class TagsController < ApplicationController

  def new
    Tag.new
  end

  def create
    @post = Post.find(params[:post_id])
    @tag = @post.tags.new(tag_params)
    @tag.save
    @post.tags << @tag
    redirect_to posts_path
  end

  private

    def tag_params
      params.require(:tag).permit(:name)
    end

end
