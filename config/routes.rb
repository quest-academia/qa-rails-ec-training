Rails.application.routes.draw do
  root 'static_pages#home'
  get 'carts/show', to: 'carts#show', as: 'carts_show'
  post 'carts/add_cart', to: 'carts#add_cart'
  patch 'carts/change_quantity/:array_index', to: 'carts#change_quantity', as: 'carts_change_quantity'
  delete 'carts/:array_index', to: 'carts#destroy', as: 'carts'
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
