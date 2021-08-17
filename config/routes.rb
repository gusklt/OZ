Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show]
  root to: 'pages#home'
<<<<<<< HEAD
  resources :performances, only: [:index] do
    resources :bookings, only: [:new, :create]
  end
=======
  resources :performances
>>>>>>> 7552ea24461369f7c3944db310dc85fbb78c3787

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
