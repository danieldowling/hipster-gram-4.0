Rails.application.routes.draw do
  resources :users

  root "static_pages#index"

  # session routes
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'
end
