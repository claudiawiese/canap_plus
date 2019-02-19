Rails.application.routes.draw do
  get 'events/index'
  devise_for :users
  root to: 'pages#home'
  resources :events, only: [:index, :show, :new, :create, :destroy]
end
