Rails.application.routes.draw do
  devise_for :users
  resources :users
  resources :manufacturer_taxonomies
  resources :industry_taxonomies
  resources :process_taxonomies
  resources :finished_products_taxonomies
  resources :materials_taxonomies
  resources :machines_taxonomies
  resources :taxonomies
  resources :companies
  resources :regions
  root 'welcome#index'
  get 'welcome/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
