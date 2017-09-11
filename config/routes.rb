Rails.application.routes.draw do
  resources :blogs
  resources :users, only: [:index, :show, :edit, :update, :destroy] do
    resources :blogs, only: [:index], module: :users
  end
  resources :tags, only: [:index, :show]

  get "/sign_up", to: "sign_up#index"
  get "/auth/:provider/callback", to: "sessions#create"
  get "/signout", to: "sessions#destroy", as: :signout

  root 'blogs#index'
end
