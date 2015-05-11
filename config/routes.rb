Rails.application.routes.draw do
  devise_for :users

  resources :people, only: [:show, :index] do
    resources :bios, only: [:new, :create]
  end
  resources :users, only: [:show, :index] do
    resources :questions, only: [:show, :edit, :update]
  end

  root 'home#show'

end
