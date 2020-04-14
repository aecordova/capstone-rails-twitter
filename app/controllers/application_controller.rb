class ApplicationController < ActionController::Base
  include SessionsHelper

  def go_home_if_logged_in
    return unless logged_in?

    redirect_to home_path
  end

  def login_first
    return if logged_in?

    redirect_to login_path
  end
end
