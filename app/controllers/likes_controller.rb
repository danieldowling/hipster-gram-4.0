class LikesController < ApplicationController
  def new

  end

  def create
    @like = current_user.likes.new #creates a new like attached to the current user
    @post_that_is_liked = Post.find(params[:post_id])
    @owner_of_liked_post = @post_that_is_liked.user
    @like.post = Post.find(params[:post_id]) #the new likes post is equal to that posts specific id
    @like.save #save the like
    @user_that_likes_post = @like.post.user #store the likes post_id and current user info in a variable
    # redirect_to @like.post.user
    # redirect_to @user
    
    if Post.find(params[:post_id]).likes.count == 10
      # p '***************'
      # p '***************'
      # p '***************'
      # p "Hipster index should be incrementing"
      # p "@post_that_is_liked is #{@post_that_is_liked}"
      # p "@post user is#{@owner_of_liked_post.first_name}"
      @owner_of_liked_post.hipster_index += 1
      # p "@post just got incremented, value is #{@owner_of_liked_post.hipster_index}"
      if @owner_of_liked_post.save!
        puts 'It saved hipster index'
      else
        puts 'that shit failed'
      end
      @like.post.destroy
      # p "hipster index of post owner is #{@owner_of_liked_post.hipster_index}"
      redirect_to user_path(@user_that_likes_post)
    else
      redirect_to user_path(@user_that_likes_post) #redirect to the user path of user which made the post that is being liked
    end
  end

  
  



  private
  def like_params
    params.require(:like).permit(:post_id)
  end
end





