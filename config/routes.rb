Rails.application.routes.draw do
  resources :finished_products_taxonomies
  resources :materials_taxonomies
  resources :machines_taxonomies
  resources :taxonomies
  resources :users
  resources :companies
  resources :regions
  root 'welcome#index'
  get 'welcome/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
