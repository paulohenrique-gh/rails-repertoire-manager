Rails.application.routes.draw do
  devise_for :users
  root to: 'home#index'

  resources :instruments, only: [:index, :show, :new, :create, :edit, :update]
  resources :periods, only: [:index, :show, :new, :create, :edit, :update]
  resources :composers, only: [:index, :show, :new, :create, :edit, :update]
  resources :pieces, only: [:index, :new, :create]
end
