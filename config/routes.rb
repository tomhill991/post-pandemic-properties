Rails.application.routes.draw do
  root to: "pages#home"
  get 'properties', { to: 'properties#index' }
  get '/properties/:id', to: 'properties#show', as: 'properties_show'
  devise_for :users
  get 'properties', { to: 'pages#properties' }

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
