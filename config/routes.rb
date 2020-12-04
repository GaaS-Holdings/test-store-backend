Rails.application.routes.draw do
  resources :products, only: :index
  resources :cart, only: :index

  namespace :cart do
    resources :add, only: :create
    resources :delete, only: :create
    resources :update, only: :create
  end
end
