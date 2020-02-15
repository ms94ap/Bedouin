Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :admin do
    resources :taxonomies
  end

  namespace :admin do
    resources :categories
  end

  resources :companies

  # resources :companies do
  #   resources :products
  # end

  resources :users do
    resources :companies
  end

  root to: "welcome#home"
end
