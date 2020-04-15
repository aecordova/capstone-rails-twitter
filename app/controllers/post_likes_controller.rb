class PostLikesController < ApplicationController
  def create
    if current_user.like(params[:id])
      render json: { liked?: true }
    else
      render json: { liked?: false }
    end
  end

  def destroy
    if current_user.unlike(params[:id])
      render json: { liked?: false }
    else
      render json: { liked?: true }
    end
  end
end
