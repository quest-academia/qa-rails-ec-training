Rails.application.routes.draw do
  root 'static_pages#home'
  get 'carts', to: 'carts#show', as: 'carts_show'
  post 'carts/add_cart'
  patch 'carts/change_item/:array_index', to: 'carts#change_item', as: 'carts_change_item'
  delete 'carts/:array_index', to: 'carts#destroy', as: 'cart'
  get 'products/index'
  get '/purchase_completed', to: 'static_pages#purchase_completed', as: 'purchase_completed'
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  resources :users
  resources :orders
  resources :products
end
