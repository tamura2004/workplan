Rails.application.routes.draw do
  scope :api do
    get "works/chart"

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
  end

  root "users#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
