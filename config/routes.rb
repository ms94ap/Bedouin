Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users
  # resources :users do
  #   resources :companies
  # end

  root to: "welcome#home"
end
