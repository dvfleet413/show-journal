Rails.application.routes.draw do
  resources :shows
  resources :users do
    resources :reviews, only: [:index, :show, :new, :create, :edit, :update]
    resources :shows, only: [:index, :show]
  end
  resources :composers
  resources :genres
end
