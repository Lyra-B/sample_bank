Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "home#index"

  resource :dashboard, only: :show, controller: :dashboard

  resource :transactions, only: :create
end
