class RentersController < ApplicationController
    
    def index 
        #@renters = Renters.all
        # Decides how many renters to show per page
        @renters = Renters.page(params[:page]).per(10)
    end
    def show
        @renters = Renters.find(params[:id])
    end
end
