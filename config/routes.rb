Rails.application.routes.draw do
  get 'users/show'

  devise_for :users
  get 'welcome/index'

  get 'welcome/about'

  root to: 'users#show'
end
