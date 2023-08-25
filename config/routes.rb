# frozen_string_literal: true

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root for https://
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :new, :show, :create]
  end
end
