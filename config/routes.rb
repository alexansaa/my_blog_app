Rails.application.routes.draw do
  devise_for :users

  root 'users#index'

  namespace :api, defaults: { format: 'json' } do
    post 'login' => 'sessions#create'
    resources :users do
      resources :posts, only: [:index] do
        resources :comments, only: [:index, :create]
      end
    end
  end  

  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :new, :create, :destroy] do
      resources :comments, only: [:new, :create, :destroy]
    end
    post 'posts/:post_id/likes', to: 'likes#create', as: :post_likes
  end
end
