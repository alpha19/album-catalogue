Rails.application.routes.draw do
  resources :albums
  resources :users

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  post "/signup", to: "users#create"
  post "/login", to: "sessions#create"
  post "/logout", to: "sessions#destroy"
  get "/authorized", to: "sessions#show"
  get "/dashboard", to: "users#show"

  # Defines the root path route ("/")
  # root "articles#index"
end
