Rails.application.routes.draw do
    get '/bikes/:id/switchAvailability', to: 'bikes#switchAvailability'
    
    #Creates standard routes for different controllers
    resources :bikes
    resources :renters
    
    #Makes home page bikes#index view
    root :to => redirect('/bikes')
end
