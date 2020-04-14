Rails.application.routes.draw do

  resources :shows do
    collection do
      get :from_nineteenth_century, to: 'shows#index', defaults: {filter: 'from-nineteenth-century'}
      get :from_twentieth_century, to: 'shows#index', defaults: {filter: 'from-twentieth-century'}
      get :from_twentyfirst_century, to: 'shows#index', defaults: {filter: 'from-twentyfirst-century'}
      get :popular, to: 'shows#index', defaults: {filter: 'popular'}
    end
    resources :reviews, only: [:index, :show]
    resources :viewings, only: [:new, :create, :edit, :update, :destroy]
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
  get '/privacy', to: 'static#privacy'
  root 'static#home'
end
