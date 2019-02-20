Rails.application.routes.draw do
  get 'events/index'
  devise_for :users
  root to: 'pages#home'

  resources :events, only: [:index, :show, :new, :create, :destroy] do
    resources :reservations, only: [:new, :create]
  end
end
