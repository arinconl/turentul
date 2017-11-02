class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  #Allows us to access current user
  helper_method :current_user

  def current_user
    @current_user ||= Renter.find(session[:renter_id]) if session[:renter_id]
  end
  
end
