Rails.application.routes.draw do
  scope :api do
    get "works/chart"

    resources :depts
    resources :ranks

    resources :projects do
      scope module: :projects do
        resources :orders
      end
    end

    resources :groups
    resources :systems

    resources :months
    resources :users
    resources :orders

    resources :works
    resources :assigns
    resources :costs
  end

  root "project#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

__END__
