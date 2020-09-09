Rails.application.routes.draw do
  #devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  devise_for :users, controllers: { omniauth_callbacks: 'omniauth_callbacks' }

  get "/users/:id", to: 'users#show', as: 'user'
  get "/users/:id/edit", to: 'users#edit', as: 'edit_profile'
  get '/about', to: 'welcome#about'
  get '/contact', to: 'welcome#contact'
  get '/legal', to: 'welcome#legal'
  get '/version', to: 'welcome#version'
  get '/styleguide', to: 'welcome#styleguide'
  get '/random', to: 'welcome#random'
  get '/roulette', to: 'welcome#random'
  patch "/users/:id", to: 'users#update'
  match 'users/:id' => 'users#destroy', :via => :delete, :as => :admin_destroy_user

  resources :blogs
  # The next 2 need to be after blogs resource
  # The old web was using /blog/ and not /blogs/ - We want to keep the links working.
  get 'blog', to: 'blogs#index'
  get 'blog/:id', to: 'blogs#show'

  # These are admin only
  resources :process_taxonomies, path: 'processes'
  resources :materials_taxonomies, path: 'materials'
  resources :industry_taxonomies, path: 'industries'
  resources :finished_products_taxonomies
  resources :manufacturer_taxonomies
  resources :media
  resources :machines_taxonomies
  resources :taxonomies

  get 'taxtree', to: 'taxonomies#tree'
  resources :companies
  resources :regions
  root 'welcome#index'
  get 'welcome/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
