Rails.application.routes.draw do
  devise_for :users
  resources :users, only: :show
  root 'tweets#index'
   resources :tweets do
    resources :comments, only: :create
  end
  resources :bests, only: [:create, :destroy]
  resources :likes, only: [:create, :destroy]
  resources :users, only: :show
  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :relationships, only: [:create, :destroy]
end
