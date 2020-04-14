class SessionsController < ApplicationController
  def new; end

  before_action :go_home_if_logged_in, only: %i[new create]

  def create
    @user = User.find_by(username: params[:username])
    puts 'User: ' + @user&.username.to_s
    if @user&.authenticate(params[:password])
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
