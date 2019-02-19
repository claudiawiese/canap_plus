Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get    "events/:id",      to: "events#show"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :events, only: [:new, :create, :destroy]
end
