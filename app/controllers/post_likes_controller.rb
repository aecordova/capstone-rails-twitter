class PostLikesController < ApplicationController
  def create
    result = if current_user.like(params[:id])
               true
             else
               false
             end
    render json: { liked: result }
  end

  def destroy
    result = if current_user.unlike(params[:id])
               false
             else
               true
             end
    render json: { liked: result }
  end
end
