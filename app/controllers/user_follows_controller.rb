class UserFollowsController < ApplicationController
  def create
    @msg = 'Following' if current_user.follow(params[:id])
    respond_to do |format|
      format.js { render layout: false }
    end
  end

  def destroy
    flash[:success] = 'Aww! no more posts from this user on your timeline' if current_user.unfollow(params[:id])
  end
end
