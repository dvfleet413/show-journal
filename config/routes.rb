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
  

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  post '/logout', to: 'sessions#destroy'

  get '/auth/facebook/callback', to: 'sessions#create'

  get '/about', to: 'static#about'

  root 'static#home'
end
