Rails.application.routes.draw do
  #devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  devise_for :users, controllers: {
    omniauth_callbacks: 'omniauth_callbacks'
  }

  get '/about', to: 'welcome#about'
  get '/contact', to: 'welcome#contact'
  get '/faq', to: 'welcome#faq'
  get '/legal', to: 'welcome#legal'
  get '/glossary', to: 'welcome#glossary'
  get '/version', to: 'welcome#version'
  get '/styleguide', to: 'welcome#styleguide'
  get '/random', to: 'welcome#random'
  get '/stats', to: 'welcome#stats'
  get '/roulette', to: 'welcome#random'

  get "/favorites", to: 'users#favorites'
  get "/users", to: 'users#index'
  get "/users/:id", to: 'users#show', as: 'user'
  get "/users/:id/edit", to: 'users#edit', as: 'edit_profile'
  patch "/users/:id", to: 'users#update'
  match 'users/:id' => 'users#destroy', :via => :delete, :as => :admin_destroy_user

  resources :blogs, path: 'blog'
  # The old web was using /blog/ and not /blogs/ - We want to keep the links working.

  # These are admin only
  resources :process_taxonomies, path: 'processes'
  resources :materials
  resources :industry_taxonomies, path: 'industries'
  resources :finished_products_taxonomies, path: 'finished_products'
  resources :manufacturer_taxonomies, path: 'manufacturers'
  resources :machines_taxonomies, path: 'machines'
  resources :media
  resources :taxonomies

  get 'taxtree', to: 'taxonomies#tree'
  get '/companies_advanced', to: 'companies#advanced'
  resources :companies do
    member do
      delete :delete_image_attachment
      patch :edit_employee
      patch :move_employee
      patch :toggle_favorite
    end
  end
  resources :regions do
    member do
      get 'join'
      get 'leave'
      delete :delete_partner_image
    end
  end
  root 'welcome#index'
  get 'welcome/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
