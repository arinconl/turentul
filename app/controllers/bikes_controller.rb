#The default controller for the Bike Model
class BikesController < ApplicationController
    before_action :force_log_in, :except => [:index, :show]
    before_action :checkCCN, :only => [:checkin]
    
    #Used to get tickets for logged in user (if the user is logged in) and to 
    #get all the available bikes
    def index 
        if session[:logged_in]
            if Ticket.exists?(renterID: session[:renter_id])
                @tickets = Ticket.where(renterID: session[:renter_id]).order(checkout: :desc).reorder(active: :desc)
                # Converts the @tickets array into a paginate_array using Kaminari
                # Necessary because Kaminari doesn't work with normal arrays
                @tickets = Kaminari.paginate_array(@tickets).page(params[:ticket_page]).per(3)
            else
                # Kaminari expects to use page on the Model itself (thats the only way it works)
                # It can have an order inbetween (example below in else)
                @tickets = nil
            end
        end
        #@bikes = Bike.all
        # Decides how many bikes to show per page
        @bikes = Bike.order("availability desc").page(params[:bike_page]).per(9)
    end
    
    #Shows the bikes based on bike :id
    def show
        @bike = Bike.find(params[:id])
    end
    
    #Finds current bike and flips the availability and creates the ticket
    #for the user if the bike was available. 
    #If the bike was unavailable
    #then it checks the bike in and closes the ticket
    def switchAvailability
        #Flips the availability
        @bike = Bike.find(params[:id])
        #flash[:newAvailability] = @bike.availability
        @newAvailability = !@bike.availability
        
        #Stores hash for updating/creating new ticket upon check in/out
        attributes = Hash.new

        if @bike.availability #Checks bike out
            #Creates new ticket from the given data
            #attributes[:ticket] = 'TN123'
            attributes[:renterID] = current_user.renterID
            attributes[:renterName] = session[:renter_name]
            attributes[:email] = current_user.email
            attributes[:bikeid] = @bike.bikeid
            #attributes[:cCN] = current_user.cCN
            attributes[:serialnumber] = @bike.serialnumber
            attributes[:checkout] = DateTime.now
            #attributes[:checkin] = null
            attributes[:location] = @bike.location
            attributes[:fare] = @bike.fare
            attributes[:active] = true
            @ticket = Ticket.new(attributes)
            @ticket.save!
            
            #Updates availability and pushes flash message
            flash[:success] = "Bike sucessfully checked out!"
            @bike.update_attribute(:availability, @newAvailability)
            
            redirect_to :controller => 'tickets', :action => 'show', :id => @ticket.id
        else #Checkin bike
        #Checkin the bike and updates ticket to complete
            # session[:checkin] = DateTime.now
            # session[:active] = false
            @ticket = Ticket.find_by(renterID: current_user.renterID, bikeid: @bike.bikeid, active: true)
            if @ticket
                #Updates ticket values if found
                session[:amount] = @ticket.totalFare
                session[:bikeid] = @bike.bikeid
                # @ticket.update(attributes)
                # flash[:success] = "Bike successfully checked in!"
                # @bike.update_attribute(:availability, @newAvailability)
                redirect_to :controller => 'payments', :action => 'new'
            else
                #Returns warning if you are trying to check in a bike you did not check out
                flash[:warning] = "You did not check out this bike!"
                if @ticket
                    redirect_to :controller => 'tickets', :action => 'show', :id => @ticket.id
                else
                    redirect_to bikes_path
                end
            end
            
            
        end

    end
    
    #Update current bike's checkin time to current time and active status to false
    def checkin
        attributes = Hash.new
        @bike = Bike.find(params[:id])
        attributes[:checkin] = DateTime.now
        attributes[:active] = false
        @bike.update_attribute(:availability, @newAvailability)
        @ticket = Ticket.find_by(renterID: current_user.renterID, bikeid: @bike.bikeid, active: true)
        @ticket.update(attributes)
        flash[:success] = "Bike successfully checked in!"
        session[:amount] = nil
        session[:bikeid] = nil
        session[:paid] = nil
        redirect_to :controller => 'tickets', :action => 'show', :id => @ticket.id
    end

    #Used for the default REST "new" action
    def new
        @bike = Bike.new
    end
    
    #Used for the CRUD "create" action
    def create
        @bike = Bike.new(bike_params)
        # Checks the validations in bike.rb to make sure all necessary fields 
        # are filled
        if @bike.valid?
            @bike.save
            #Notify creation of bike
            flash[:create] = "#{@bike.bikeid} has been added!"
            #Redirect to the newly created bike page
            redirect_to :action => "show", :id => @bike.id
        else
            #Notify errors of bike creation
            flash[:errors] = @bike.errors
            #Redirect back to the same page, with errors now shown on top
            redirect_to :action => "new"
        end
    end
    
    #Used for the default REST "edit" action
    def edit
        @bike = Bike.find params[:id]
    end
    
    #Used for the CRUD "update" action
    def update
        @bike = Bike.find params[:id]
        if @bike.update(bike_params)
            #Notify update of bike
            flash[:update] = "#{@bike.bikeid} has been updated!"
            #Redirect to the newly created bike page
            redirect_to :action => "show", :id => @bike.id
        else
            flash[:errors] = @bike.errors
            redirect_to :action => "edit"
        end
    end
    
    #Used for the CRUD "destroy" action
    def destroy
       @bike = Bike.find(params[:id])
       @bike.destroy
       flash[:delete] = "#{@bike.bikeid} has been deleted!"
       redirect_to bikes_path
    end
    
    private
        #Contains all parameters for when a bike is made
        #[bikeid, serialnumber, rating, condition, maintenance, style, size, color, availability, lastcheck, location, fare, accessories, picture]
        def bike_params
            params.require(:bike).permit(:bikeid, :serialnumber, :rating, :condition, :maintenance, :style, :size, :color, :availability, :lastcheck, :location, :fare, :accessories, :picture)
        end
    
end
