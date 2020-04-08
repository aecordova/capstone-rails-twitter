Rails.application.routes.draw do
  resources :users, only: [:show]
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  
  resources :posts, only: [:create]
  get '/home', to: 'posts#index'
  
end

