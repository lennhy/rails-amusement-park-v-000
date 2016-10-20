Rails.application.routes.draw do
  root 'users#index'

  # sessions
   get "/signin", to: "sessions#new"
   post "/sessions/create", to: "sessions#create"
   delete "/signout", to: "sessions#destroy"

   # rides
   post "/rides/new", to: "rides#new"

   # users
   post "/users/:id", to: "users#show"

  resources :users
  resources :attractions

end
