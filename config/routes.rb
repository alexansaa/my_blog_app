Rails.application.routes.draw do
  root 'users#index'
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :new, :create] do
      resources :comments, only: [:new, :create]
      # resources :likes, only: [:create]
    end
    post 'posts/:post_id/likes', to: 'likes#create', as: :post_likes
  end
end
