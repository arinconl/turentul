class TicketsController < ApplicationController

#before_action :force_log_in
    
  def index #Shows a list of the tickets currently in the database (10 at a time)
      @tickets = Ticket.page(params[:page]).per(10)
  end
    
  def show #Shows info about the renter
      @ticket = Ticket.find(params[:id])
      @total = total_fare(@ticket)
  end
  
  def new
    @ticket = Ticket.new
  end
  

  def create
  end
  
  #Creates helper method for calculating fare
  def total_fare(currentTicket)
    #Finds the elapsed time in hours
    elapsed_time = (DateTime.now-currentTicket.checkout.to_datetime)*24.to_i
    #Calculates fare from hourly rate
    return currentTicket.fare*elapsed_time
  end
  
  helper_method :total_fare
  
end
