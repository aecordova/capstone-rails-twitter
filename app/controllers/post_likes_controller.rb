# frozen_string_literal: true

class PostLikesController < ApplicationController
  def create
    if current_user.like(params[:id])
      # status = 200
    else
      # status = 304
    end
  end

  def destroy
    if current_user.unlike(params[:id])
      # status = 200
    else
      # status = 304
    end
  end
end
