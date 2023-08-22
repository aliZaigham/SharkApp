Rails.application.routes.draw do
  devise_for :users
  #devise_for :users

  resources :items

  root to: "users#index"

end

