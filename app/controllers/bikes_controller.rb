class BikesController < ApplicationController
    before_action :force_log_in, :except => [:index, :show]
    
    def index 
        if session[:logged_in]
            @tickets = Ticket.find_by(renterID: session[:renterID])
            if @tickets != nil
                @tickets = Kaminari.paginate_array(@tickets).page(params[:ticket_page]).per(3)
            else
                @tickets = Ticket.page(params[:ticket_page]).per(3)
            end
            @bikes = Bike.order("availability desc").page(params[:bike_page]).per(9)
        else
            #@bikes = Bike.all
            # Decides how many bikes to show per page
            @bikes = Bike.order("availability desc").page(params[:bike_page]).per(9)
        end
    end
    
    def show
        @bike = Bike.find(params[:id])
    end
    
    def switchAvailability
        #Flips the availability
        @bike = Bike.find(params[:id])
        #flash[:newAvailability] = @bike.availability
        @newAvailability = !@bike.availability
        
        #Stores hash for updating/creating new ticket upon check in/out
        attributes = Hash.new

        if @bike.availability 
            #Creates new ticket from the given data
            #attributes[:ticket] = 'TN123'
            attributes[:renterID] = current_user.renterID
            attributes[:renterName] = session[:renter_name]
            attributes[:email] = current_user.email
            attributes[:bikeid] = @bike.bikeid
            attributes[:cCN] = current_user.cCN
            attributes[:serialnumber] = @bike.serialnumber
            attributes[:checkout] = DateTime.now
            #attributes[:checkin] = null
            attributes[:location] = @bike.location
            attributes[:fare] = @bike.fare
            attributes[:active] = true
            @ticket = Ticket.new(attributes)
            @ticket.save
            
            #Updates availability and pushes flash message
            flash[:success] = "Bike sucessfully checked out!"
            @bike.update_attribute(:availability, @newAvailability)
            
            redirect_to :action => "show", :id => Bike.find(params[:id])
        else #Checkout bike and creates a ticket for the bike
        #Checkin the bike and updates ticket to complete
            attributes[:checkin] = DateTime.now
            attributes[:active] = false
            @ticket = Ticket.find_by(renterID: current_user.renterID, bikeid: @bike.bikeid)
            if @ticket
                #Updates ticket values if found
                @ticket.update(attributes)
                flash[:success] = "Bike successfully checked in!"
                @bike.update_attribute(:availability, @newAvailability)
            else
                #Returns warning if you are trying to check in a bike you did not check out
                flash[:warning] = "You did not check out this bike!"
            end
            
            redirect_to :action => "index"
        end

    end

    #Uses the default REST "new" action
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
    
    #Uses the default REST "edit" action
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
    
    def destroy
       @bike = Bike.find(params[:id])
       @bike.destroy
       flash[:delete] = "#{@bike.bikeid} has been deleted!"
       redirect_to bikes_path
    end
    
    private
        #Contains all parameters for when a bike is made
        def bike_params
            params.require(:bike).permit(:bikeid, :serialnumber, :rating, :condition, :maintenance, :style, :size, :color, :availability, :lastcheck, :location, :fare, :accessories, :picture)
        end
    
end
