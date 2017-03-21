Rails.application.routes.draw do
  scope :api do
    get "works/chart"

    resources :depts
    resources :ranks
    resources :groups
    resources :systems
    resources :months
    resources :projects
    resources :users
    resources :orders
    resources :works
    resources :costs
    resources :assigns

    namespace :assigns do
      resources :users, only: [:show, :edit, :update]
    end
  end

  root "project#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
