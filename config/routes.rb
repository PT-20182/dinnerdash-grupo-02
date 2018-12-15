Rails.application.routes.draw do
  get 'backoffice_user/show'
  get 'backoffice_user/new'
  get 'backoffice_user/edit'
  get 'users/show'
  get 'users/edit'
  get 'users/edit'
  get 'users/show'
  root to: 'homes#index'
  resources :pedidos
  resources :order_meals
  resources :orders
  resources :situations
  resources :meals
  resources :categories
  post 'homes/delete_meal'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
