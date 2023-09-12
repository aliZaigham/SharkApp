Rails.application.routes.draw do
  #Cart path
  get 'cart' => 'cart#show'
  post 'cart/add'
  post 'cart/remove'
  patch 'cart/update'

  #stripe
  get 'succes' => 'checkout#succes'
  get 'fail' => 'checkout#fail'
  get 'aboutus' => 'checkout#aboutus'
  get 'contact' => 'checkout#contact'
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
  #get 'admin' => 'subitems#admin'

  root to: "items#index"


  #Admin
  get 'Dashboard' => 'admin#adminDashboard'
  get 'admin/subitem' => 'admin#subitem_admin'
  get 'adminitem' => 'admin#item_admin'
  get 'adminOrder' => 'admin#adminOrder'
end

