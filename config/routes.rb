Rails.application.routes.draw do
  #devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  devise_for :users, controllers: {
    omniauth_callbacks: 'omniauth_callbacks',
    registrations: 'users/registrations'
  }

  # Redirect rules to help the old web to new web migration
  get '/birmingham', to: redirect('/regions/birmingham')
  get '/brighton', to: redirect('/regions/brighton')
  get '/derby', to: redirect('/regions/derby')
  get '/scotland', to: redirect('/regions/scotland')
  get '/sweden', to: redirect('/regions/sweden')
  get '/uae', to: redirect('/regions/uae')
  get '/uae/companies/', to: redirect('/companies?q%5Bregions_id_in%5D%5B%5D=6&q%5B')

  get '/about', to: 'welcome#about'
  get '/contact', to: 'welcome#contact'
  get '/faq', to: 'welcome#faq'
  get '/getting_listed', to: 'welcome#getting_listed'
  get '/glossary', to: 'welcome#glossary'
  get '/legal', to: 'welcome#legal'
  get '/random', to: 'welcome#random'
  get '/roulette', to: 'welcome#random'
  get '/searching', to: 'welcome#searching'
  get '/stats', to: 'welcome#stats'
  get '/styleguide', to: 'welcome#styleguide'
  get '/version', to: 'welcome#version'

  get "/created_by_me", to: 'users#created_by_me'
  get "/my_companies", to: 'users#my_companies'
  get "/favorites", to: 'users#favorites'

  get "/users", to: 'users#index'
  get "/users/:id", to: 'users#show', as: 'user'
  get "/users/:id/edit", to: 'users#edit', as: 'edit_profile'
  patch "/users/:id", to: 'users#update'
  match 'users/:id' => 'users#destroy', :via => :delete, :as => :admin_destroy_user
  delete "/users/:id/delete_avatar", to: 'users#delete_avatar', as: 'delete_user_avatar'

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
  resources :character_tags

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
