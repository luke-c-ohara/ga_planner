class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, alert: "Sorry, you can't access this page"
  end

  private
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  
end
