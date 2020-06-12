# frozen_string_literal: true

Rails.application.routes.draw do
  resources :comments
  get 'sessions/new'
  get 'users/new'
  get 'home', to: 'static_pages#home'
  get 'help', to: 'static_pages#help'
  get 'static_pages/help'
  get 'static_pages/home'
  root 'static_pages#home'
  get '/signup', to: 'users#new'
  resources :users
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :users
  resources :account_activations, only: [:edit]
  resources :microposts,only: [:create, :destroy]
  resources :relationships,only: [:create, :destroy]
  resources :password_resets,only: [:new, :create, :edit, :update]
  resources :comments
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end