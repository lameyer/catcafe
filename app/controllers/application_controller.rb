class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  helper_method :current_user

  def ensure_admin
    redirect_to root_path unless current_user.id == 1
  end

  def ensure_logged_in
    redirect_to root_path unless current_user
  end

end
