class BikesController < ApplicationController
    def index 
        #@bikes = Bike.all
        # Decides how many bikes to show per page
        @bikes = Bike.page(params[:page]).per(10)
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
end
