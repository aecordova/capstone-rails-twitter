Rails.application.routes.draw do
  
  class OnlyAjaxCalls
    def matches?(req)
      req.xhr?
    end
  end

  root 'posts#index'

  resources :users, only: [:show,:update]
  
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  resources :posts, only: [:create]
  get '/home', to: 'posts#index'

  post '/follow', to: 'followings#create'
  delete '/follow', to: 'followings#destroy'

  post '/like', to: 'post_likes#create'
  delete '/like', to: 'post_likes#destroy'

  post '/new_comment', to: 'comments#create'

end

