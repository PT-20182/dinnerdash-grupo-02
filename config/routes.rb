Rails.application.routes.draw do
  resources :situations
  resources :meals
  resources :categories
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
