class FollowingsController < ApplicationController
  def create
    result = if current_user.follow(permitted[:id])
               true
             else
               false
             end
    render json: { followed: result }
  end

  def destroy
    result = if current_user.unfollow(permitted[:id])
               false
             else
               true
             end
    render json: { followed: result }
  end

  private

  def permitted
    params.permit(:id)
  end
end
