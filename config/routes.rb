Rails.application.routes.draw do
  resources :users, only: [:new, :create]
  resource :session, only: [:new, :create, :destroy]
  # resources :subs
  resources :posts, except: [:new, :index]
  resources :subs do
    resources :posts, only: [:new]
  end
end
