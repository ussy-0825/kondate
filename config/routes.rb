Rails.application.routes.draw do
  devise_for :users
  root to: 'menus#index'
  resources :recipes
  resources :menus
end
