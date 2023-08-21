# frozen_string_literal: true

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root for https://
  root to: 'users#index'

  #root for https://users/745
  get '/users/:id', to: 'users#show' as: :user

  #root for https://users/745/post
  get '/users/author_id/posts', to: 'posts#index' as: :user_posts

  #root for https://users/745/posts/3
  get '/users/author_id/posts/:id', to: 'posts#show' as: :user_post
end
