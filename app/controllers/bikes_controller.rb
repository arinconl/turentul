class BikesController < ApplicationController
    def index 
        #@bikes = Bike.all
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
=begin
        if @bike.availability
            redirect_to :action => "index"
        else
            redirect_to :action => "show", :id => Bike.find(params[:id])
        end
=end
    end
end
