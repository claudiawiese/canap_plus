Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  get '/dashboard', to: 'profils#dashboard'
  get '/profil', to: 'profils#show'

  resources :events, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
    resources :reservations, only: [:new, :create]
  end
end
