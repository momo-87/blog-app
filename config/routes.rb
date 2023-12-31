# frozen_string_literal: true

Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root for https://
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :new, :show, :create, :destroy] do
      resources :comments, only: [:new, :create, :destroy]
      resources :likes, only: [:create]
    end
  end

# Define routes for API
  namespace :api do
    resources :users, only: [:index, :show] do
      resources :posts, only: [:index] do
        resources :comments, only: [:index, :create]
      end
    end
  end
end

