class PostLikesController < ApplicationController
  
  def create
    if current_user.like(params[:id])
      @msg = 'liked'
    end
    respond_to do |format|
      format.js { render layout: false }
    end
  end
  
  def destroy
    if current_user.unlike(params[:id])
      @msg= 'unliked'
    end
    respond_to do |format|
      format.js { render layout: false }
    end
  end
end
