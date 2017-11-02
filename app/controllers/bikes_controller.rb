class BikesController < ApplicationController
    def index 
        #@bikes = Bike.all
        # Decides how many bikes to show per page
        @bikes = Bike.page(params[:page]).per(9)
    end
    
    def show
        @bike = Bike.find(params[:id])
    end
    
    def switchAvailability
        #Flips the availability
        @bike = Bike.find(params[:id])
        #flash[:newAvailability] = @bike.availability
        @newAvailability = !@bike.availability
        @bike.update_attribute(:availability, @newAvailability)

        if @bike.availability
            flash[:success] = "Bike sucessfully checked in!"
            redirect_to :action => "index"
        else
            flash[:success] = "Bike sucessfully checked out!"
            redirect_to :action => "show", :id => Bike.find(params[:id])
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
