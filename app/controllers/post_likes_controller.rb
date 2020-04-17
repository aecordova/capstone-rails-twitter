class PostLikesController < ApplicationController
  def create
    result = if current_user.like(like_params)
               true
             else
               false
             end
    render json: { liked: result }
  end

  def destroy
    result = if current_user.unlike(like_params)
               false
             else
               true
             end
    render json: { liked: result }
  end

  private

  def like_params
    params.permit(:id)
  end
end
