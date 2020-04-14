class CommentsController < ApplicationController
  def create
    @comment = current_user.comments.build(comment_params)
    if @comment.save
      flash[:success] = 'Comment added successfully'
      redirect_back fallback_location: home_path
    else
      flash[:danger] = 'Could not add comment'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:post_id, :comment)
  end
end
