Rails.application.routes.draw do
  root "clients#index"

  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create]
  resources :clients, only: [:index, :new, :create, :show] do
    resources :announcements, only: [:new, :create, :index, :show]
  end
  resources :journalists, only: [:index, :new, :create, :show]

  resources :announcements, only: [] do
    resources :pitches, only: [:new, :create, :update, :index]
    resources :batch_pitches, only: [:new, :create, :index]
  end

  resources :pitch_topics, only: [:create]
end
