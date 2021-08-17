Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show]
  root to: 'pages#home'
  resources :performances, only: [:index] do
    resources :booking, only: [:new, :create, :show]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
