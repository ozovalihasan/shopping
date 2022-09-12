Rails.application.routes.draw do

  resources :order_items
  resources :orders
  resources :answers
  resources :questions
  resources :reviews
  resources :products do 
    resources :questions
  end
  resources :categories
  
  devise_for :sellers
  devise_for :customers
  devise_for :admins
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "categories#index"
end
