class SessionsController < ApplicationController
  def create
    renter = Renter.from_omniauth(env["omniauth.auth"])
    session[:logged_in] = true
    session[:renter_id] = renter.id
    session[:renter_name] = renter.renterName
    flash[:notice] = "Log in successful!"
    redirect_to root_path
  end

  def destroy
    session[:renter_id] = nil
    session[:logged_in] = nil
    session[:renter_name] = nil
    flash[:notice] = "Log out successful!"
    redirect_to root_path
  end
end
