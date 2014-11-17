Rails.application.routes.draw do
  root "clients#index"

  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create]
  resources :clients, only: [:index, :new, :create, :show] do
    resources :announcements, only: [:new, :create, :index]
  end
  resources :clients, only: [:index, :new, :create, :show]
  resources :pitches, only: [:new, :create, :index]
end
