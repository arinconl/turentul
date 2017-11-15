Rails.application.routes.draw do

    #get 'sessions/create'
    
    #get 'sessions/destroy'
    
    get 'home/show'

    get '/bikes/:id/switchAvailability', to: 'bikes#switchAvailability'
    get '/bikes/new', to: 'bikes#new'
    get '/bikes/:id/edit', to: 'bikes#edit'
    
    get '/about', to: 'home#about'
    get '/pricing', to: 'home#pricing'
    get '/error', to: 'home#error'
    
    #Creates standard routes for different controllers
    resources :bikes
    resources :renters
    resources :tickets
    
    #Makes home page bikes#index view
    #root :to => redirect('/bikes')
    

    get 'auth/:provider/callback', to: 'sessions#create'
    get 'auth/failure', to: redirect('/')
    get 'signout', to: 'sessions#destroy', as: 'signout'
    
    # Added these for cucumber testing
    # sessions#create_guest makes a fake user for Cucumber testing with hard coded data 
    # so that session[:logged_in] is true
    get 'auth/guest', to: 'sessions#create_guest'
    # sessions#loggedin checks that the user is logged in and outputs session[:logged_in] to log folder
    # Since it is used by Cucumber, the output is put into the bottom of log/test.log
    get 'auth/loggedin', to: 'sessions#loggedin'

    resources :sessions, only: [:create, :destroy]
    get '/login', to: 'sessions#login'
    
    resource :home, only: [:show]

    root to: "home#show"
    
    get '*path' => redirect('/error')
end
