Rails.application.routes.draw do
  root 'welcome#index'
  get 'welcome/index'
  resources :countries
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
