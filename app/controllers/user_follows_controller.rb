class UserFollowsController < ApplicationController
  
  def create
    if current_user.follow(params[:id])
      flash[:success] = "Yay! You'll now see posts from this user on your timeline"
    end
  end
  
  def destroy
    if current_user.unfollow(params[:id])
      flash[:success] = "Aww! no more posts from this user on your timeline"
    end
  end
end
