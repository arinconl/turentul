class RentersController < ApplicationController
    def index #Shows a list of the renters currently in the database (10 at a time)
        @renters = Renter.page(params[:page]).per(10)
    end
    def show #Shows info about the renter
        @renter = Renter.find(params[:id])
    end
end
