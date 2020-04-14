class UsersController < ApplicationController
  before_action :login_first, only: [:show]
  def new; end

  def create
    @user = User.new(user_params)
    if @user.save
      login @user
      flash[:success] = @user.username + ', Welcome to Holler!'
      redirect_to @user
    else
      render html: 'Not created'
    end
  end

  def show
    @user = User.find(params[:id])
    @u_posts = @user.posts.newest_first
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end

  def login_first
    return if logged_in?

    redirect_to login_path
  end
end
