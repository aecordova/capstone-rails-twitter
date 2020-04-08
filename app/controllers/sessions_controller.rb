class SessionsController < ApplicationController
  def new; end

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

end
