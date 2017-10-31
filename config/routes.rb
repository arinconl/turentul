Rails.application.routes.draw do
    get '/bikes/:id/switchAvailability', to: 'bikes#switchAvailability'
    
    #Creates standard routes for different controllers
    resources :bikes
    resources :renters
    
    #Makes home page bikes#index view
    root :to => redirect('/bikes')
    
    #Routes corresponding to login
    match 'auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
    match 'auth/failure', to: redirect('/'), via: [:get, :post]
    match 'signout', to: 'sessions#destroy', as: 'signout', via: [:get, :post]
end
