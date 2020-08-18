Rails.application.routes.draw do

  root 'sessions#welcome'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/signup' => 'gardeners#new'
  # post signup route is taken care of by resources :gardeners
  post '/logout' => 'sessions#destroy'


  resources :notes
  resources :plants
  resources :gardens
  resources :gardeners
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
