Rails.application.routes.draw do
  devise_for :users

  resources :people, only: [:show, :index] do
    resources :bios, only: [:new, :create]
  end


  root 'home#show'

end
