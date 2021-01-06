Rails.application.routes.draw do
  root 'static_pages#home'
  get '/purchase_completed', to: 'static_pages#purchase_completed', as: 'purchase_completed'  
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get '/orders', to:'orders#show'
  resources :users
end
