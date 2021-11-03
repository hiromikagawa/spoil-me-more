Rails.application.routes.draw do
  get 'users/show'
  devise_for :users
  root 'tweets#index'
   resources :tweets do
    resources :comments, only: :create
  end
  resources :user, :only => [:show]
end
