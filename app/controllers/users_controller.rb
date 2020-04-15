class UsersController < ApplicationController
  before_action :login_first, only: [:show]
  before_action :go_home_if_logged_in, only: [:new]
  def new
    @user = User.new
  end

  def update
    @user = User.find(params[:id])
    if @user&.update(profile_img: params[:user][:profile_img])
    else
      flash[:error] = 'Could not change picture'
    end
    redirect_back fallback_location: current_user
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = @user.username + ', Welcome!'
      login @user
      redirect_to home_path
    else
      render :new
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
end
