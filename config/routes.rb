Rails.application.routes.draw do
  resources :orders
  resources :months
  resources :works
  resources :assigns
  resources :costs
  resources :projects
  resources :systems
  resources :users
  resources :groups
  resources :ranks
  resources :depts
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
