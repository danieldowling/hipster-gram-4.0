class UsersController < ApplicationController
  before_action :require_login, except: [:new, :create]

	def index
    @users = User.includes(:posts).joins(:posts).uniq.order(:hipster_index)

    respond_to do |format|
      format.html
      format.js
    end
	end

  def show
    @user = User.find(params[:id])
    # @post = Post.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id.to_s
      redirect_to users_path
    else
      render :new
    end

  end

  def edit
    @user = User.find(params[:id])  
  end

  def update
    @user = User.find(params[:id])

    if @user.update_attributes(user_params)
      redirect_to users_path
    else
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to root_path
  end


private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :image_url)
  end



  def require_login
    unless logged_in?
      flash[:error] = "You must be logged in to access that page!"
      redirect_to root_path
    end
  end


end
