class PostsController < ApplicationController
  before_action :login_first, only: [:index]
  def index
    t_posts
  end

  def create
    @post = current_user.posts.build(post_params)
    puts 'Valid post?' + @post.valid?.to_s
    if @post.save
      puts 'Post saved:' + @post.content.to_s
      redirect_to home_path
    else
      render html: 'Post not created'
    end
  end

  private

  def post_params
    params.require(:post).permit(:content)
  end

  def t_posts
    @t_posts ||= current_user.timeline_posts
  end

  def login_first
    return if logged_in?

    redirect_to login_path
  end
end
