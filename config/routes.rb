Rails.application.routes.draw do
  resources :webhooks, only: [:new, :create]

  resources :order_items
  resources :orders
  resources :answers
  resources :questions
  resources :reviews
  resources :products do 
    resources :questions
    resources :reviews
  end
  resources :categories
  resources :main_categories
  
  devise_for :sellers
  devise_for :customers
  devise_for :admins
  devise_for :users

  # Defines the root path route ("/")
  root "main_categories#index"
end
