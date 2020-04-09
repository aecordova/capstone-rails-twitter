class PostsController < ApplicationController
  def create
    @post = current_user.posts.build(post_params)
  end
  
end
