Rails.application.routes.draw do

  root "staticpages#home", to: "staticpages#home"
  get "staticpages/:page", to: "staticpages#show"
  post "/signup", to: "users#create"
  resources :users, only: %i(new create show)
end
