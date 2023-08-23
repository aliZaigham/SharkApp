Rails.application.routes.draw do

  devise_for :users, controllers: { sessions: 'users/sessions', unlocks: 'users/unlocks' }, controllers: { unlocks: 'unlocks' }

  
  resources :items

  root to: "items#index"

end

