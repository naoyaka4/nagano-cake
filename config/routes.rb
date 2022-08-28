Rails.application.routes.draw do

  devise_for :admin, skip: [:registrations, :passwords], controllers: {
  sessions: "admin/sessions"
}

  devise_for :customers, skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

  namespace :admin do
    root to: "homes#top"
    resources :orders, only: [:show, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :genres, only: [:index, :edit, :create, :update]
    resources :products, only: [:new, :index, :show, :edit, :create, :update, :destroy]
    patch 'order_details/:id' => 'order_details#update'
  end


  scope module: :public do
    root to: 'homes#top'
    get '/about' => 'homes#about'
    get '/customers/check' => 'customers#check'
    patch '/customers/withdraw' => 'customers#withdraw'
    get '/customers/my_page' => 'customers#show'
    get '/customer/information/edit' => 'customers#edit'
    patch '/customer/information' => 'customers#update'
    resources :addresses, only: [:index, :edit, :create, :update, :destroy]
    
    post '/orders/check' => 'orders#check'
    get '/orders/complete' => 'orders#complete'
    resources :orders, only: [:new, :index, :show, :create]
    resources :cart_products, only: [:index, :update, :destroy, :create]do
    collection do
    delete 'destroy_all'
    
    
    end
    end
    #delete '/cart_products/destroy_all' => 'cart_products#destroy_all'
    resources :products, only: [:index, :show]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
