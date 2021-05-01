Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'pages#home'
  devise_for :users
  resources :properties do
    resources :bookings, only: %i[create edit destroy] do
      resources :reviews, only: %i[create edit destroy]
    end
  end
end
