Rails.application.routes.draw do
  resources :notes
  resources :plants
  resources :gardens
  resources :gardeners
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
