Rails.application.routes.draw do
  scope :api do
    get "works/chart"

    resources :depts
    resources :ranks
    resources :groups
    resources :systems
    resources :months

    resources :projects do
      scope module: :projects do
        resources :orders
      end
    end

    resources :users do
      scope module: :users do
        resources :assigns
      end
    end

    resources :orders do
      scope module: :orders do
        resources :assigns
        resources :costs
      end
    end

    resources :works
    resources :assigns
    resources :costs

  end

  root "project#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
