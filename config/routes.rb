Rails.application.routes.draw do
  root 'homes#index'
  devise_for :users

  resources :pizzerias do
    resources :reviews, only: [:new, :create]
  end
  resources :reviews, only: [:show, :edit, :update, :destroy] do
    resources :comments, only: :create
    resources :votes, only: :create
  end
  resources :users, only: [:show, :destroy]

  resources :comments, only: [:edit, :update, :destroy]

  namespace :admin do
    resources :users, only: [:index]
    resources :pizzerias, only: [:index]
    resources :reviews, only: [:index]
    resources :comments, only: [:index]
  end
end
