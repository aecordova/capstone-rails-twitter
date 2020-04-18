class PostLikesController < ApplicationController
  def create
    result = if post && current_user.like(post.id)
               true
             else
               false
             end
    render json: { done: result, likes: post.like_ct }
  end

  def destroy
    result = if post && current_user.unlike(post.id)
               true
             else
               false
             end
    render json: { done: result, likes: post.like_ct }
  end

  private

  def permitted
    params.permit(:id)
  end

  def post
    id = permitted[:id]
    @post ||= Post.find(id) if Post.exists?(id)
  end

end
