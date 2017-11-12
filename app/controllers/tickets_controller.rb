class TicketsController < ApplicationController

#before_action :force_log_in
    
  def index #Shows a list of the tickets currently in the database (10 at a time)
      @tickets = Ticket.page(params[:page]).per(10)
  end
    
  def show #Shows info about the renter
      @ticket = Ticket.find(params[:id])
  end
  
  def new
    @ticket = ticket.new
  end
  

  def create
  end
end
