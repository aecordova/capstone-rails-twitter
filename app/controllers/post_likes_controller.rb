class PostLikesController < ApplicationController
  def create
    result = if current_user.like(permitted[:id])
               true
             else
               false
             end
    render json: { liked: result }
  end

  def destroy
    result = if current_user.unlike(permitted[:id])
               false
             else
               true
             end
    render json: { liked: result }
  end

  private

  def permitted
    params.permit(:id)
  end
end
