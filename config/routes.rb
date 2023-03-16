Rails.application.routes.draw do
  resources :tenants, only: [:index, :update, :create, :destroy]
  resources :leases, only: [:destroy, :create]
  resources :apartments, only: [:index, :update, :create, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
