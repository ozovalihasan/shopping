Rails.application.routes.draw do
  
  get 'products/search', to: 'products#search'
  resources :webhooks, only: [:new, :create]

  resources :order_items
  resources :orders, only: %i[ index show ]
  resources :answers
  resources :questions
  resources :reviews
  resources :products, only: %i[ index show ] do 
    resources :questions
    resources :reviews
  end
  resources :categories, only: [:show]
  resources :main_categories, only: [:index, :show]
  resources :base_categories, only: [:index]
  
  devise_for :sellers
  devise_for :customers
  devise_for :admins
  devise_for :users

  # Defines the root path route ("/")
  root "main_categories#index"
end
