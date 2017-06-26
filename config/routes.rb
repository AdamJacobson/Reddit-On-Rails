Rails.application.routes.draw do

  resources :users, only: [:new, :create]
  resource :session, only: [:new, :create, :destroy]
  # resources :subs
  resources :posts, except: [:new, :index] do
    resources :comments, only: [:new]
  end
  resources :subs do
    resources :posts, only: [:new]
  end
  resources :comments, only: [:create, :show]

end
