Rails.application.routes.draw do

  get 'sessions/new'

  root "staticpages#home", to: "staticpages#home"
  get "staticpages/:page", to: "staticpages#show"
  post "/signup", to: "users#create"

  resources :users, only: %i(new create show)

  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
end
