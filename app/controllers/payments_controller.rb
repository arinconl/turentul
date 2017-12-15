#Controller for processing payments
class PaymentsController < ApplicationController
  
  #Filters for payment page 
  before_action :force_log_in
  before_action :require_admin, except: [:new, :create]

  #Shows all current payments
  def index
    @payments = Payment.all
  end

  #Default CRUD
  def new
    @payment = Payment.new
  end

  #Default CRUD
  def create
    @payment = Payment.new(payment_params)

    if @payment.save
      if @payment.process
        # redirect_to payments_path, notice: "The user has been successfully charged." and return
        redirect_to :controller => 'bikes', :action => 'checkin', :id => session[:bikeid] and return
      end
    end
    render 'new'
  end

  private
    #Used for CRUD
    def payment_params
      params.require(:payment).permit(:first_name, :last_name, :credit_card_number, :expiration_month, :expiration_year, :card_security_code, :amount)
    end
 
end