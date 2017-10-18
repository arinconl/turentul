class BikesController < ApplicationController
    def index 
        @bikes = Bike.all
    end
    def show
        @bike = Bike.find(params[:id])
    end
    def switchAvailability
        #Flips the availability
        @bike = Bike.find(params[:id])
        newAvailability = !@bike.availability
        @bike.update_attribute(:availability, newAvailability)
        
        if @bike.availability
            redirect_to :action => "index"
        else
            redirect_to :action => "show", :id => Bike.find(params[:id])
        end
    end
end
