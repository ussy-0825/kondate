Rails.application.routes.draw do
  devise_for :users
  root to: 'menus#index'
  resources :recipes, only: [:new, :create, :show, :edit, :update]
  resources :menus, only: [:new, :create]
end
