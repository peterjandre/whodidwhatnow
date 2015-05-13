Rails.application.routes.draw do
  devise_for :users

  resources :people, only: [:show, :index, :update, :edit] do
    resources :bios, only: [:new, :create]
    resources :answers, only: [:new, :create]
  end
  resources :users, only: [:show, :index] do
    resources :answers, only: [:show, :edit, :update]
  end

  resources :answers

  root 'home#show'

end
