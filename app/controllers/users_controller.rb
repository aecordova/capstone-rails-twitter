class UsersController < ApplicationController

  def new; end

  def create
    @user = User.new(user_params) 
    if @user.save
      login @user
      flash[:success] = @user.username + ", Welcome to Holler!"
      redirect_to @user
    else
      render html: "Not created"
    end
  end
  
  private

  def user_params
    params.require(:user).permit(:username)
  end
end
