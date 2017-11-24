class RentersController < ApplicationController
    
    before_action :force_log_in
    before_action :require_admin, except: [:show]
    
    def index #Shows a list of the renters currently in the database (10 at a time)
        @renters = Renter.page(params[:page]).per(10)
    end
    
    def show #Shows info about the renter
        @renter = Renter.find(params[:id])
    end
    
    def new
        @renter = Renter.new
    end
    
    def create
        renter_params[:admin] = false;
        @renter = Renter.new(renter_params)
        if @renter.valid?
            @renter.save
            flash[:create] = "#{@renter.renterName} has been added!"
            redirect_to :action => "show", :id => @renter.id
        else
            flash[:errors] = @renter.errors
            redirect_to :action => "new"
        end
    end
    
    def edit
        @renter = Renter.find params[:id]
    end
    
    def update
        @renter = Renter.find params[:id]
        if @renter.update(renter_params)
            flash[:update] = "#{@renter.name} has been updated!"
            redirect_to :action => "show", :id => @renter.id
        else
            flash[:errors] = @renter.errors
            redirect_to :action => "edit"
        end
    end
    
    def destroy
        @renter = Renter.find params[:id]
        @renter.destroy
        flash[:delete] = "#{@renter.renterName} has been deleted!"
        redirect_to renters_path
    end
    
    private
        def renter_params
            params.require(:renter).permit(:renterID, :provider, :renterName, :oauth_token, :oauth_expires_at, :cCN, :tickets, :numRents, :birthday, :email, :phone)
        end
end
