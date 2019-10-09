Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :blogs
  resources :users, only: %i[index show edit update destroy] do
    resources :blogs, only: [:index], module: :users
  end
  resources :tags, only: %i[index show]

  resources :my, only: :index

  get '/sign_up', to: 'sign_up#index'
  get '/auth/:provider/callback', to: 'sessions#create'
  get '/signout', to: 'sessions#destroy', as: :signout

  root 'blogs#index'
end
