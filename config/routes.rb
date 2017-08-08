Rails.application.routes.draw do
  get "users/signup", to: "users#new"

  root "staticpages#home", to: "staticpages#home"

  get "staticpages/:page", to: "staticpages#show"
end
