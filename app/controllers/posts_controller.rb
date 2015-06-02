class PostsController < ApplicationController

 before_action :authorized?, only: [:edit, :update]
  
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
    @users = User.all
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    
      if @post.save
        redirect_to users_path
      else
        render :new
      end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])

    if @post.update_attributes(post_params)
      redirect_to users_path
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to users_path
  end

  def is_liked
    @post = Post.find(params[:id])
    @post.is_liked += 1
    @post.save
    redirect_to user_path
  end

  private
  def post_params
    params.require(:post).permit(:image_url, :description, :is_liked, :user_id)
  end

    def authorized?
      unless current_user = Post.find(params[:id])
          flash[:error] = "You are not authorized to access that page."
          redirect_to users_path 
      end
    end

end
