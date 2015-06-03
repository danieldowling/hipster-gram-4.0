class LikesController < ApplicationController
  def new
  end

  def create
    @like = current_user.likes.new #creates a new like attached to the current user
    @like.post = Post.find(params[:post_id]) #the new likes post is equal to that posts specific id
    @like.save #save the like
    @user = @like.post.user #store the likes post_id and current user info in a variable
    # redirect_to @like.post.user
    # redirect_to @user
    redirect_to user_path(@user) #redirect to the user path of user which made the post that is being liked
  end

  def mainstream
   @post = Post.find(:post_id).likes.count

   if @post == 10
    @post.destroy
    @post.save
   else
    redirect_to user_path
   end

  end

  private
  def like_params
    params.require(:like).permit(:post_id)
  end
end
