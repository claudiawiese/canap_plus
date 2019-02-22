Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  get "/dashboard", to: "pages#dashboard"
  resources :events, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
    resources :reservations, only: [:new, :create, :edit, :update, :destroy]
  end
end
