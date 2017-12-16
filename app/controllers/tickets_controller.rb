#The default controller for the Tickets Model
class TicketsController < ApplicationController

#before_action :force_log_in
    
  #Shows a list of the tickets currently in the database (10 at a time) (CRUD Method)
  def index
      @tickets = Ticket.page(params[:page]).per(10)
  end
    
  #Shows info about the tickets
  def show
      @ticket = Ticket.find(params[:id])
  end
  
  #Creates a spot for a new renter in the Ticket Model
  def new
    @ticket = Ticket.new
  end
  
  #Finds the ticket to edit based on the Ticket ID
  def edit
    @ticket = Ticket.find params[:id]
  end
  
  #Creates and populates ticket information into a new ticket (CRUD Method)
  def create
    @ticket = ticket.new(ticket_params)
    if @ticket.valid?
      @ticket.save
      flash[:create] = "#Ticket {@ticket.ticket} has been created!"
      redirect_to :action => "show", :id =>@ticket.id
    else
      flash[:errors] = @ticket.errors
      redirect_to :action => "new"
    end
  end
  
  #Updates the ticket with the information stored in ticket_params (CRUD Method)
  def update
    @ticket = ticekt.find params[:id]
    if @ticket.update(ticket_params)
      flash[:update] = "Ticket #{@ticket.ticket} has been updated!"
      redirect_to :action => "show", :id => @ticket.id
    else
      flash[:errors]= @ticket.errors
      redirect_to :action => "edit"
    end
  end
  
  #Destroys the ticket (CRUD Method)
  def destroy
    @ticket = Ticket.find params[:id]
    @ticket.destroy
    flash[:delete] = "Ticket #{@ticket.ticket} has been removed!"
    redirect_to tickets_path
  end
  
  private
  #Used for CRUD
  #Requires ticket, renterID, renterName, email, bikeid, cCN, serialnumber, checkout, checkin, location, fare, active
  def ticket_params
    params.require(:ticket).permit(:ticket, :renterID, :renterName, :email, :bikeid, :cCN, :serialnumber, :checkout, :checkin, :location, :fare, :active)
  end
  
end
