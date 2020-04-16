class UserFollowsController < ApplicationController
  def create
    result = if current_user.follow(params[:id])
               true
             else
               false
             end
    render json: { followed: result }
  end

  def destroy
    result = if current_user.unfollow(params[:id])
               false
             else
               true
             end
    render json: { followed: result }
  end
end
