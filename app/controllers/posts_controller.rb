class PostsController < ApplicationController
	def new
    @user = current_user
    @post = @user.posts.new
  end

  def create
    @user = current_user
    @post = @user.posts.new(post_params)
      if @post.save
        redirect_to posts_path
      else
        render :new
      end
  end
end
