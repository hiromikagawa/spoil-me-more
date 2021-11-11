Rails.application.routes.draw do
  devise_for :users
  resources :users, only: :show
  
  root 'tweets#index'
   resources :tweets do
    resources :comments, only: :create
  end
  resources :users, only: :show
  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :relationships,  only: [:create, :destroy]
end
