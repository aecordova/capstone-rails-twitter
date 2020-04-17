class UsersController < ApplicationController
  before_action :login_first, only: [:show]
  before_action :go_home_if_logged_in, only: [:new]

  def new
    @user = User.new
  end

  def update
    if current_user.update(photo_params)
      flash[:success] = 'Profile pic updated!'
    else
      flash[:error] = 'Could not update profile pic'
    end
    redirect_back fallback_location: current_user
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = @user.username + ', Welcome to SayIt!'
      login @user
      redirect_to home_path
    else
      render :new
    end
  end

  def show
    @user = User.find(permitted[:id])
    @u_posts = @user.posts.includes(%i[comments post_likes]).newest_first
  end

  private

  def permitted
    params.permit(:id)
  end

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end

  def photo_params
    params.require(:user).permit(:photo)
  end
end
