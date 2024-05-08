Rails.application.routes.draw do
  devise_for :users

  root to: "pages#home"

  get "/profile", to: "pages#profile"
  get "/sitters", to: "sitters#index"

  resources :cats do
    resources :matches, only: [ :create]
    resources :cat_tags, only: [ :new, :create ]
  end
  get "/cats/:cat_id/matches/", to: "matches#create"
  resources :users, only: [] do
    resources :matches, only: [:create]
  end




  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
