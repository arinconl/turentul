class SessionsController < ApplicationController
  def create
    session[:logged_in] = true
#    renter = Renter.from_omniauth(env["omniauth.auth"])
=begin
    session[:renter_id] = renter.id
    session[:renter_name] = renter.renterName
=end
    flash[:notice] = "Log in successful!"
    #redirect_to root_path
    redirect_to "/auth/facebook", id: "sign_in"
  end

  def destroy
    session[:logged_in] = nil
=begin
    session[:renter_id] = nil
    session[:renter_name] = nil
=end
    flash[:notice] = "Log out successful!"
    redirect_to root_path
  end
end
