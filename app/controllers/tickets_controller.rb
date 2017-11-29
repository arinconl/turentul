class TicketsController < ApplicationController

#before_action :force_log_in
    
  def index #Shows a list of the tickets currently in the database (10 at a time)
      @tickets = Ticket.page(params[:page]).per(10)
  end
    
  def show #Shows info about the renter
      @ticket = Ticket.find(params[:id])
  end
  
  def new
    @ticket = Ticket.new
  end
  
  def switchActive
    @ticket = Ticket.find(params[:id])
    @newActivity = !@ticket.active
    @ticket.update_attribute(:active, @newActivity)
    
    if @ticket.avilability
      flash[:success] = "Ticket has been paid!"
      redirect_to :action => "index"
    end
    
  end
  
  
  def edit
    @ticekt = Tickets.find params[:id]
  end
  

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
  
  def destroy
    @ticket = Ticket.find params[:id]
    @ticket.destroy
    flash[:delete] = "Ticket #{@ticket.ticket} has been removed!"
    redirect_to tickets_path
  end
  
  private
  def ticket_params
    params.require(:ticket).permit(:ticket, :renterID, :renterName, :email, :bikeid, :cCN, :serialnumber, :checkout, :checkin, :location, :fare, :active)
  end
  
end
