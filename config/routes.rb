Rails.application.routes.draw do
  root "staticpages#home", to: "staticpages#home"

  get "staticpages/:page", to: "staticpages#show"
end
