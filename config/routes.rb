Rails.application.routes.draw do

    #get 'sessions/create'
    
    #get 'sessions/destroy'
    
    get 'home/show'

    get '/bikes/:id/switchAvailability', to: 'bikes#switchAvailability'
    get '/bikes/new', to: 'bikes#new'
    get '/bikes/:id/edit', to: 'bikes#edit'
    
    #Creates standard routes for different controllers
    resources :bikes
    resources :renters
    
    #Makes home page bikes#index view
    #root :to => redirect('/bikes')
    

    get 'auth/:provider/callback', to: 'sessions#create'
    get 'auth/failure', to: redirect('/')
    get 'signout', to: 'sessions#destroy', as: 'signout'

    resources :sessions, only: [:create, :destroy]
    get '/login', to: 'sessions#login'
    
    resource :home, only: [:show]

    root to: "home#show"
    
    #This will redirect any other paths/error paths
    #uses the wildcard selector
    #currently sends to hom
    get '*path' => redirect('/')
end
