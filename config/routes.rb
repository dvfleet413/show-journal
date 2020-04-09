Rails.application.routes.draw do
  resources :shows do
    resources :reviews, only: [:index, :show]
    resources :viewings, only: [:new, :create]
  end

  resources :users do
    resources :reviews, only: [:index, :show, :edit, :update]
    resources :shows, only: [:index, :show, :new, :create]
  end
  resources :composers
  resources :genres
  

  get '/login', to: 'users#get_login'
  post '/login', to: 'users#post_login'
  post '/logout', to: 'users#logout'

  get '/about', to: 'static#about'

  root 'static#home'
end
