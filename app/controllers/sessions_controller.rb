class SessionsController < ApplicationController
  def create
    renter = Renter.from_omniauth(env["omniauth.auth"])
    session[:renter_id] = renter.id
    redirect_to root_path
  end

  def destroy
    session[:renter_id] = nil
    redirect_to root_path
  end
end
