Rails.application.routes.draw do
  resources :blogs
  resources :users

  get "/auth/:provider/callback", to: "sessions#create"
  get "/signout", to: "sessions#destroy", as: :signout

  root 'blogs#index'
end
