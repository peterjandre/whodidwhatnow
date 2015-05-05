Rails.application.routes.draw do
  devise_for :users

  resources :people, only: [:show]

  root 'home#show'

end
