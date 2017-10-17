Rails.application.routes.draw do
    get '/bikes/:id/switchAvailability', to: 'bikes#switchAvailability'
    resources :bikes
    root :to => redirect('/bikes')
end
