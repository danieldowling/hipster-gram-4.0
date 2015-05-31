Rails.application.routes.draw do
  resources :users
  resources :posts

  root "static_pages#index"

  # session routes
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'
end
