Rails.application.routes.draw do
  devise_for :users
  root to: 'home#index'

  resources :instruments, only: [:index, :show, :new, :create, :edit, :update]
end
