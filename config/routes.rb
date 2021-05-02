Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_for :users, :path => '', :path_names => { :sign_in => "login", :sign_out => "logout", :sign_up => "register" }
  root to: 'pages#home'
  get '/about', to: 'pages#about'
  get '/contact', to: 'pages#contact'
  get '/privacy', to: 'pages#privacy'
  get '/users/:id', to: 'users#show', as: 'user_profile'

  resources :properties do
    resources :bookings, only: %i[create edit destroy] do
      resources :reviews, only: %i[create edit destroy]
    end
  end
end
