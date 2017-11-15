class SessionsController < ApplicationController
  # Forces the user to be logged in (:force_log_in method is in ApplicationController)
  # except for the pages mentioned after :except
  before_action :force_log_in, :except => [:create, :login, :create_guest, :loggedin]
  def create

    renter = Renter.from_omniauth(env["omniauth.auth"])

    session[:renter_id] = renter.id
    session[:renter_name] = renter.renterName
    session[:logged_in] = true
    flash[:notice] = "Log in successful!"
    
    redirect_to "/login"
    #redirect_to "/auth/facebook", id: "sign_in"
  end
  
  # Creates a fake guest for Cucumber testing so that session[:logged_in] is true
  # This is necessary so that we can test actions that only logged in users can do
  def create_guest
<<<<<<< HEAD
    # @renter = Renter.new(renterID: "123456789012345678901", renterName: "Chris Moroz", email: "chrismoroz9@gmail.com", phone: "(234)-394-1948", cCN: "1234567890123456")
    # @renter.save!
    session[:renter_id] = "123456789012345678901"
=======
    session[:renter_id] = 123456789012345678901
>>>>>>> 09c042914dcec3b138ef376f043e92f9aa0b369e
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
