Rails.application.routes.draw do
  resources :images

  get "/" => "images#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/slider" => "images#slider"
end
