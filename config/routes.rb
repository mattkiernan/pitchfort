Rails.application.routes.draw do
  root "clients#index"

  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create]
  resources :clients, only: [:index, :new, :create, :show]
  resources :announcements, only: [:new, :create, :index, :show]
  resources :pitches, only: [:new, :create, :update, :index, :show]
  resources :journalists, only: [:index, :new, :create, :show]

  resources :clients, only: [] do
    resources :announcements
    resources :pitches
  end

  resources :announcements, only: [] do
    resources :pitches
    resources :batch_pitches, only: [:new, :create, :index]
  end

  resources :pitch_topics, only: [:create]
end
