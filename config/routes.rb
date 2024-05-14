Rails.application.routes.draw do
  get 'ratings/new'
  devise_for :users

  root to: "pages#home"

  get "/profile", to: "pages#profile"
  get "/sitters", to: "sitters#index"
  patch "/matches/:id/accept", to: "matches#accept", as: :accept_match
  patch "/matches/:id/decline", to: "matches#decline", as: :decline_match


  resources :cats do
    resources :matches, only: [:create]
    resources :cat_tags, only: [:new, :create]
    resources :ratings, only: [:new, :create]
    collection do
      get :top, :map
    end
  end
  get "/cats/:cat_id/matches/", to: "matches#create"

  resources :users, only: [] do
    resources :matches, only: [:index, :create]
    resources :ratings, only: [:new, :create]
  end
  resources :chatrooms, only: [:index, :show ] do
    resources :messages, only: :create
    resources :ratings, only: [:new, :create]
  end
  resources :notifications, only: :show





  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
