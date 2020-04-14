class PostLikesController < ApplicationController
  def create
    if current_user.like(params[:id])
      render json: current_user
    else
      puts @message = 'failure'
    end
  end

  def destroy
    if current_user.unlike(params[:id])
      render json: current_user
    else
      render json: { status: 304 }
    end
  end
end
