Rails.application.routes.draw do
  resources :blogs
  resources :users do
    resources :blogs, only: [:index], module: :users
  end

  get "/auth/:provider/callback", to: "sessions#create"
  get "/signout", to: "sessions#destroy", as: :signout

  root 'blogs#index'
end
