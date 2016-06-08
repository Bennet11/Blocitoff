Rails.application.routes.draw do


  devise_for :users

  resources :users, only: [:show] do
    resources :items, only: [:create]
  end

  root to: 'users#show'

  get 'users/show'
  get 'welcome/index'
  get 'welcome/about'
end
