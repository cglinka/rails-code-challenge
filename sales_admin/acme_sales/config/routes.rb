Rails.application.routes.draw do
  devise_for :users

  root 'sales#index'
  post '/upload_sales', to: 'sales#upload_sales'

  resources :sales
  resources :products
  resources :customers
  resources :merchants
end
