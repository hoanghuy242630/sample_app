Rails.application.routes.draw do
  get "password_resets/new"

  get "password_resets/edit"

  root "staticpages#home", to: "staticpages#home"
  get "staticpages/:page", to: "staticpages#show"
  post "/signup", to: "users#create"
  get "/signup", to: "users#new"
  resources :users
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

  resources :users do
    member do
      get :following, :followers
    end
  end

  resources :account_activations, only: :edit
  resources :password_resets, except: %i(index show destroy)
  resources :microposts, only: %i(create destroy)
  resources :relationships, only: %i(create destroy)
end
