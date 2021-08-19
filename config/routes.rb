Rails.application.routes.draw do
  get 'reviews/new'
  get 'reviews/create'
  get 'reviews/index'
  get 'reviews/show'
  devise_for :users
  resources :users, only: [:show]
  root to: 'pages#home'

  resources :performances, only: [:index] do
    resources :bookings, only: [:new, :create, :edit, :update, :index]
  end

  resources :performances


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
