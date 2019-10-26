Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'jobs#index'
  resources :jobs do
    resources :claims, only: :create
    resources :messages, only: :create
    
  end 

  resources :users, only: :show 
  resources :notifications


   get 'current_user_id' => "users#current_user_id"

end
