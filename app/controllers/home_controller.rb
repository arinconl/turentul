#The default controller for the Home Model (however, there is no home model.
#We just use Home to store the static pages)
class HomeController < ApplicationController
    def show
        redirect_to "/about"
    end
end
