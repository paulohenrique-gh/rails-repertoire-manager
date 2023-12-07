Rails.application.routes.draw do
  devise_for :users
  root to: 'home#index'

  resources :instruments, only: [:index, :new, :create]
end
