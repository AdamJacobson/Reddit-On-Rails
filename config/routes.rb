Rails.application.routes.draw do

  resources :users, only: [:new, :create]
  resource :session, only: [:new, :create, :destroy]

  resources :posts, except: [:new, :index] do
    resources :comments, only: [:new]
  end

  resources :subs do
    resources :posts, only: [:new]
  end

  resources :comments, only: [:create, :show]

  post '/posts/:id/upvote', to: 'posts#upvote', as: 'post_upvote'
  post '/posts/:id/downvote', to: 'posts#downvote', as: 'post_downvote'

  post '/comments/:id/upvote', to: 'comments#upvote', as: 'comment_upvote'
  post '/comments/:id/downvote', to: 'comments#downvote', as: 'comment_downvote'
end
