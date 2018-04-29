Rails.application.routes.draw do
  # resources :images

  get "/" => "images#index"
  get "/slider" => "images#slider"
  get "/search" => "images#search"
  get "/new" => "images#new"
  post "/new" => "images#new"

  get "/canvas" => "images#canvas"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :images
end
