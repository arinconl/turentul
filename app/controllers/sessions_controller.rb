#The default controller for Session (used for omniauth-google-oauth2)
class SessionsController < ApplicationController
  # Forces the user to be logged in (:force_log_in method is in ApplicationController)
  # except for the pages mentioned after :except
  before_action :force_log_in, :except => [:create, :login, :create_guest, :loggedin]
  
  #Creates a new Renter by pulling information from omniauth-google-oauth2
  def create

    renter = Renter.from_omniauth(env["omniauth.auth"])

    session[:renter_id] = renter.id
    session[:renter_name] = renter.renterName
    session[:logged_in] = true
    flash[:notice] = "Log in successful!"
    
    redirect_to "/login"
    #redirect_to "/auth/facebook", id: "sign_in"
  end
  
  #Creates a fake guest for Cucumber testing so that session[:logged_in] is true
  #This is necessary to test actions that only logged in users can do
  def create_guest
    session[:renter_id] = 123456789012345678901
    session[:renter_name] = "Chris Moroz"
    session[:logged_in] = true
    session[:testing?] = true
    flash[:notice] = "Log in successful!"
    redirect_to "/login"
  end
  
  # Testing method to check value of session[:logged_in]
  # The output is logged into log/test.log since it is used by Cucumber (RAILS_ENV = test)
  def loggedin
    Rails.logger.debug("session[:logged_in] is #{session[:logged_in].inspect}")
    redirect_to "/login"
  end

  #Destroys all the information in Session and redirects to the login page
  def destroy
    #Destroys all currently stored session data
    session[:logged_in] = nil
    session[:renter_id] = nil
    session[:renter_name] = nil
    
    flash[:notice] = "Log out successful!"
    redirect_to "/login"
  end
  
  #Creates login page
  def login
    #login page variables
  end
end
