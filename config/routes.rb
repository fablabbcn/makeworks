Rails.application.routes.draw do
  #devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  devise_for :users, controllers: { omniauth_callbacks: 'omniauth_callbacks' }

  get "/users/:id", to: 'users#show', as: 'user'
  get "/users/:id/edit", to: 'users#edit', as: 'edit_profile'
  get '/version', to: 'welcome#version'
  patch "/users/:id", to: 'users#update'
  match 'users/:id' => 'users#destroy', :via => :delete, :as => :admin_destroy_user

  resources :blogs
  # The next 2 need to be after blogs resource
  get 'blog', to: 'blogs#index'
  get 'blog/:id', to: 'blogs#show'

  resources :manufacturer_taxonomies
  resources :industry_taxonomies
  resources :process_taxonomies
  resources :finished_products_taxonomies
  resources :materials_taxonomies
  resources :media
  resources :machines_taxonomies
  resources :taxonomies
  resources :companies
  resources :regions
  root 'welcome#index'
  get 'welcome/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
