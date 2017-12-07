#The default controller for the Application
class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  #Allows us to access current user
  helper_method :current_user

  #Finds the current user by Renter ID. If the user is not found, then the session
  #info is set to nil.
  def current_user
    # Checks to see if we are testing with Cucumber or not. If we are then it creates a 
    # temp user with some fake data, so that the code in the views & controllers works properly
    if session[:testing?] != true
      #Checks if current session corresponds to a user in the table
      if Renter.find_by(renterID: session[:renter_id])
        @current_user ||= Renter.find(session[:renter_id]) if session[:renter_id]
      else
        #Destroys all currently stored session data if user not found
        session[:logged_in] = nil
        session[:renter_id] = nil
        session[:renter_name] = nil
      end
    else
      @current_user = Renter.new(:renterID => 123456789012345678901, :renterName => "Chris Moroz", :email => "chrismoroz9@gmail.com", :phone => "(234)-394-1948", :cCN => "1234567890123456")
    end
  end
  
  #Allows us to check if we are logged in
  private
  
  #Makes sure that the user is logged in. If they aren't, they are redirected to the login page.
  def force_log_in
    unless session[:logged_in]
      flash[:notice] = "Please log in."
      redirect_to("/login")
    end
  end
  
  #Makes sure that the user has Admin access. If they don't, they are redirected to the login page.
  def require_admin
    unless current_user.admin
      flash[:notice] = "Need admin account."
      redirect_to("/login")
    end
  end
  
end
