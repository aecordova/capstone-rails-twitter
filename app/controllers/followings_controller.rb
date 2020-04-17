class FollowingsController < ApplicationController
  def create
    result = if current_user.follow(follow_params)
               true
             else
               false
             end
    render json: { followed: result }
  end

  def destroy
    result = if current_user.unfollow(follow_params)
               false
             else
               true
             end
    render json: { followed: result }
  end

  private

  def follow_params
    params.permit(:id)
  end
end
