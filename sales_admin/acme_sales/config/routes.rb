Rails.application.routes.draw do
  resources :sales
  resources :products
  resources :customers
  resources :merchants


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'sales#index'

  post '/upload_sales', to: 'sales#upload_sales'
end
