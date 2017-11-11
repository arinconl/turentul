class SessionsController < ApplicationController
  before_action :force_log_in, :except => [:create, :login]
  def create
    session[:logged_in] = true
#    renter = Renter.from_omniauth(env["omniauth.auth"])
=begin
    session[:renter_id] = renter.id
    session[:renter_name] = renter.renterName
=end
    flash[:notice] = "Log in successful!"
    redirect_to "/login"
    #redirect_to "/auth/facebook", id: "sign_in"
  end

  def destroy
    session[:logged_in] = nil
=begin
    session[:renter_id] = nil
    session[:renter_name] = nil
=end
    flash[:notice] = "Log out successful!"
    redirect_to "/login"
  end
  
  #Creates login page
  def login
    #login page variables
  end
end
