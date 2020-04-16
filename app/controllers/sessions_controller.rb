class SessionsController < ApplicationController
  before_action :go_home_if_logged_in, only: %i[new create]
  
  def new; end

  def create
    @user = User.find_by(username: params[:username])
    if @user&.authenticate(params[:password])
      login @user
      flash[:success] = 'Welcome to SayIt!'
      redirect_to home_path
    else
      flash[:error] = 'Please check your information and try again'
      render :new
    end
  end

  def destroy
    if logout
      flash[:info] = "You have been logged out successfully"
    else
      flash[:error] = "Could not terminate the session, please try again"
    end
      redirect_to login_path
  end
end
