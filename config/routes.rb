Rails.application.routes.draw do
  resources :backoffice_users
  root to: 'homes#index'
  resources :pedidos
  resources :order_meals
  resources :orders
  resources :situations
  resources :meals
  resources :categories
  
  put '/delete', to: 'carts#delete_item', as: 'delete'
  put '/add', to: 'carts#add_item', as: 'add'
  
  devise_for :users


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
