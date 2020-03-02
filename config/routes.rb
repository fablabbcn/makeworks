Rails.application.routes.draw do
  resources :blogs
  get 'blog', to: 'blogs#index'
  get 'blog/:id', to: 'blogs#show'
  devise_for :users
  get "/users/:id", to: 'users#show', as: 'user'
  get "/users/:id/edit", to: 'users#edit', as: 'edit_profile'
  patch "/users/:id", to: 'users#update'

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
