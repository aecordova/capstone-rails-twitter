class SessionsController < ApplicationController
  def new; end

  before_action :go_home_if_logged_in, only: [:new, :create]

  def create
    @user = User.find_by(username: params[:username])
    puts "User: " + @user&.username.to_s
    if @user && @user.authenticate(params[:password])
      login @user
      redirect_to home_path
    else
      render html: 'not logged in'
    end
  end

  def destroy
      logout
      redirect_to login_path
  end

  private

  def go_home_if_logged_in
    return unless logged_in?
    
    redirect_to home_path
  end


end
