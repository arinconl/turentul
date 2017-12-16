#The default controller for the Renter Model
class RentersController < ApplicationController
    
    before_action :force_log_in
    before_action :require_admin, except: [:show,:edit,:update]
    
    #Shows a list of the renters currently in the database (10 at a time) (CRUD Method)
    def index
        @renters = Renter.page(params[:page]).per(10)
    end
    
    #Shows info about the renter
    def show
        if !(current_user.id==params[:id] || current_user.admin)
            flash[:warning] = "You don't have permission to see this."
            redirect_to "/"
        end
        @renter = Renter.find(params[:id])
        if session[:logged_in]
           if Ticket.exists?(renterID: session[:renter_id])
               @tickets = Ticket.where(renterID: session[:renter_id]).order(checkout: :desc).reorder(active: :desc)
               @tickets = Kaminari.paginate_array(@tickets).page(params[:ticket_page]).per(3)
            else
                @tickets = nil
           end
        end
    end
    
    #Creates a spot for a new renter in the Renter Model
    def new
        @renter = Renter.new
    end
    
    #Creates and populates renter information into a new renter (CRUD Method)
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
    
    #Finds the renter to edit based on the Renter ID
    def edit
        @renter = Renter.find params[:id]
    end
    
    #Updates the renter with the information stored in renter_params (CRUD Method)
    def update
        @renter = Renter.find params[:id]
        if @renter.update(renter_params)
            flash[:update] = "#{@renter.renterName} has been updated!"
            redirect_to :action => "show", :id => @renter.id
        else
            flash[:errors] = @renter.errors
            redirect_to :action => "edit"
        end
    end
    
    #Destroys the renter (CRUD Method)
    def destroy
        @renter = Renter.find params[:id]
        @renter.destroy
        flash[:delete] = "#{@renter.renterName} has been deleted!"
        redirect_to renters_path
    end
    
    private
        def renter_params
            params.require(:renter).permit(:renterID, :provider, :renterName, :oauth_token, :oauth_expires_at, :cCN, :tickets, :numRents, :birthday)
        end
end
