Rails.application.routes.draw do
  devise_for :renters
    get 'sessions/create'
    
    get 'sessions/destroy'
    
    get 'home/show'

    get '/bikes/:id/switchAvailability', to: 'bikes#switchAvailability'
    
    #Creates standard routes for different controllers
    resources :bikes
    resources :renters
    
    #Makes home page bikes#index view
    #root :to => redirect('/bikes')
    

    get 'auth/:provider/callback', to: 'sessions#create'
    get 'auth/failure', to: redirect('/')
    get 'signout', to: 'sessions#destroy', as: 'signout'

    resources :sessions, only: [:create, :destroy]
    resource :home, only: [:show]

    root to: "home#show"
    
end
