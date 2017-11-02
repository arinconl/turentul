class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  #Allows us to access current user
  helper_method :current_user

  def current_user
    @current_user ||= Renter.find(session[:renter_id]) if session[:renter_id]
  end
  
  #Allows us to check if we are logged in
  private
  
  def force_log_in
    unless session[:logged_in]
      flash[:notice] = "Please log in."
      redirect_to("/login")
    end
  end
  
end
