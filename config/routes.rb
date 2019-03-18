Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :reservations, only: [:destroy, :edit, :update]

  get "/dashboard", to: "pages#dashboard"
  resources :events, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
    resources :reservations, only: [:new, :create]
  end
end
