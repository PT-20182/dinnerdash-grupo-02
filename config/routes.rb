Rails.application.routes.draw do
  get 'order_meals/index'
  get 'order_meals/show'
  get 'order_meals/new'
  get 'order_meals/edit'
  get 'orders/index'
  get 'orders/show'
  get 'orders/edit'
  get 'orders/new'
  get 'situations/index'
  get 'situations/new'
  get 'situations/edit'
  get 'situations/show'
  resources :meals
  resources :categories
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
