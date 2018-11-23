Rails.application.routes.draw do
  get 'order_meals/index'
  get 'order_meals/show'
  get 'order_meals/edit'
  get 'order_meals/new'
  resources :meals
  resources :categories
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
