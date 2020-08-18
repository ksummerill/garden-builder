Rails.application.routes.draw do

  get '/' => 'sessions#welcome'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/signup' => 'gardeners#new'
  

  resources :notes
  resources :plants
  resources :gardens
  resources :gardeners
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
