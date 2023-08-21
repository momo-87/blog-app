# frozen_string_literal: true

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root for https://
  get '/users', to: 'users#index'

  #root for https://users/745
  get '/users/:id', to: 'users#show'

  #root for https://users/745/posts
  get '/users/:user_id/posts', to: 'posts#index'

  #root for https://users/745/posts/3
  get '/users/:user_id/posts/:id', to: 'posts#show'
end
