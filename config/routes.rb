Rails.application.routes.draw do
  
  class OnlyAjaxCalls
    def matches?(req)
      req.xhr?
    end
  end

  resources :users, only: [:show]
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  resources :posts, only: [:create]
  get '/home', to: 'posts#index'

  post '/follow', to: 'user_follows#create'
  delete '/follow', to: 'user_follows#destroy'

  post '/like', to: 'post_likes#create'
  delete '/like', to: 'post_likes#destroy'

  post '/new_comment', to: 'comments#create'

end

