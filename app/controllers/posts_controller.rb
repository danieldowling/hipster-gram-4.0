class PostsController < ApplicationController

  def index
  end

	def new
    @user = current_user
    @post = @user.posts.new
  end

  def create
    @user = current_user
    @post = @user.posts.new(post_params)
      if @post.save
        redirect_to users_path
      else
        render :new
      end
  end


  private
  def post_params
    params.require(:post).permit(:image_url, :description, :user)
  end
end
