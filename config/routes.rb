Rails.application.routes.draw do
  resources :users
  resources :posts
  resources :likes, only: [:create, :destroy]

  root "static_pages#index"

  # session routes
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'

  # liked route
  # get '/liked' => 'likes#new'
  # post '/liked' => 'likes#create', as: :liked_post

  # custom post routes
  # get "posts/:id/is_liked" => "posts#is_liked", as: :is_liked
end
