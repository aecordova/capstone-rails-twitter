module SessionsHelper
  def login user
    session[:id] = user.id
  end

  def logged_in?
    !session[:id].nil?
  end

  def current_user
    User.find(session[:id]) if logged_in?
  end
end
