class UserFollowsController < ApplicationController
  
  def create
    if current_user.follow(params[:id])
      @msg = 'Following'
    end
    respond_to do |format|
      format.js {render layout: false}
    end
  end
  
  def destroy
    if current_user.unfollow(params[:id])
      flash[:success] = "Aww! no more posts from this user on your timeline"
    end
  end
end
