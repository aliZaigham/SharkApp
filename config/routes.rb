Rails.application.routes.draw do
  #Cart path
  get 'cart' => 'cart#show'
  post 'cart/add'
  post 'cart/remove'
  patch 'cart/update'

  #stripe
  
  post 'checkout' => 'checkout#create'

  devise_for :users, controllers: { sessions: 'users/sessions', unlocks: 'users/unlocks' }

  resources :items

  get 'home' => 'home#index'

  #Subitem path
  get 'subitem' => 'subitems#index'
  get 'new' =>'subitems#new'
  post '/subitem/create' => 'subitems#create'
  get 'show/:id' => 'subitems#show'
  get 'delete/:id' => 'subitems#destroy'

  root to: "items#index"

end

