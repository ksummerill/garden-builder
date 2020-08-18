Rails.application.routes.draw do

  get '/' => "sessions#welcome"

  resources :notes
  resources :plants
  resources :gardens
  resources :gardeners
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
