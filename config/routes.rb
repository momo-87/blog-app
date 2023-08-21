# frozen_string_literal: true

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root for https://
  root to: 'users#index'

  #root for https://users/745
  get '/users/:id', to: 'users#show'

  #root for https://users/745/posts
  get '/users/:id/posts', to: 'posts#index'

  #root for https://users/745/posts/3
  get '/users/:id/posts/:post_id', to: 'posts#show'
end
