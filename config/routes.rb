Rails.application.routes.draw do
  root "clients#index"

  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create]
  resources :clients, only: [:index]
end
