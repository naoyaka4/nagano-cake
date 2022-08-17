Rails.application.routes.draw do
  
  devise_for :admins, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}

  devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}
  
  namespace :admin do
    root to: "homes#top"
    resources :orders, only: [:show, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :genres, only: [:index, :edit, :create, :update]
    resources :products, only: [:new, :index, :show, :edit, :create, :update]
    patch 'order_details/:id' => 'order_details#update'
  end
  
  
  scope module: :public do
    root to: 'homes#top'
    get '/about' => 'homes#about'
    resources :addresses, only: [:index, :edit, :create, :update, :destroy]
    resources :orders, only: [:new, :index, :show, :check, :complete, :create]
    resources :cart_products, only: [:index, :update, :destroy, :destroy_all, :create]
    resources :customers, only: [:show, :edit, :check, :withdraw, :update]
    resources :products, only: [:index, :show]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
