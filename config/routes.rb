Rails.application.routes.draw do
  root 'static_pages#home'
  get '/purchase_completed', to: 'static_pages#purchase_completed', as: 'purchase_completed'
  resources :users
end
