Rails.application.routes.draw do
  root 'static_pages#home'
  get 'static_pages/purchase_completed', to: 'static_pages#purchase_completed', as: 'purchase_completed'
end
