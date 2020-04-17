module SessionsHelper
  def login(user)
    session[:user_id] = user.id
  end

  def logged_in?
    !session[:user_id].nil? && User.where(id: session[:user_id]).exists?
  end

  def current_user
    return unless logged_in?
    
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logout
    session.delete(:user_id)
  end
  
  def go_home_if_logged_in
    return unless logged_in?

    redirect_to home_path
  end

  def login_first
    return if logged_in?

    redirect_to login_path
  end
end
