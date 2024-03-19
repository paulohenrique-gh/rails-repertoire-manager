Rails.application.routes.draw do
  devise_for :users

  root to: 'home#index'

  resources :periods, only: %i[show index new create]
end
