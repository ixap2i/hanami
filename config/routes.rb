Rails.application.routes.draw do
  # resources :images

  get "/" => "images#index"
  get "/signup" => "users#new"
  get "/login" => "sessions#new"
  delete "/logout" => "sessions#destroy"
  get "/signup" => "sessions#new"
  get "/maps" => "images#maps"
  get "/search" => "images#search"
  get "/new" => "images#new"
  post "/new" => "images#new"
  post "/login" => "sessions#create"

  get "/canvas" => "images#canvas"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :images
  resources :users
end
