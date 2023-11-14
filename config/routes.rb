Rails.application.routes.draw do
  root "users#index"
  get "users/:id" => "users#user", as: :user
  get "users/:id/posts" => "users#posts", as: :posts
  get "users/:id/posts/:p_id" => "users#post", as: :post
end
