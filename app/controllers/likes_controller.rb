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
    
    if Post.find(params[:post_id]).likes.count == 10
      # @user.hipster_index += 10
      @like.post.destroy
      redirect_to user_path(@user)
    else
      redirect_to user_path(@user) #redirect to the user path of user which made the post that is being liked
    end
  end



  private
  def like_params
    params.require(:like).permit(:post_id)
  end
end




  # def mainstream
  #  @like = current_user.likes
  #  @like.post = Post.find(params[:post_id])

  #  if @post.likes.count == 10
  #   @post.destroy
  #  else
  #   redirect_to user_path
  #  end

  # end

