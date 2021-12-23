Rails.application.routes.draw do
  # 顧客用
  # URL /customers/sign_in ...
  devise_for :customers,skip: [:passwords,], controllers: {
  registrations: "public/registrations",
  sessions: "public/sessions"
  }
 scope module: :public do
    root "categories#index"
    get "/about" => "homes#about"
    get "/orders/thanks" => "orders#thanks"
    get "/customers/my_page" => "customers#show"
    get "/customers/unsubscribe" => "customers#unsubscribe"
    patch "/customers/withdraw" => "customers#withdraw"
    resources :customers, only: [:edit, :update]
    resources :items, only: [:index, :show]do
     resource :favorites, only: [:create, :destroy]
    end
    
    resources :cart_items, only: [:index, :create, :update, :destroy]
    delete "/cart_items" => "cart_items#all_destroy"
    get 'cart_items/destroy_all' => 'cart_items#destroy_all'
    resources :orders, only: [:new, :create, :index, :show]
    post "/orders/confirm" => "orders#confirm"
    get "/orders/complete" => "orders#complete"
    resources :addresses, only: [:index, :edit ,:create, :update, :destroy]
    resources :categories, only: [:show]
    resources :admins, only: [:show]
  end
  
  # 管理者用
  # URL /admin/sign_in ...
  devise_for :admin, skip: [:passwords] ,controllers: {
  registrations: "manage/registrations",
  sessions: "manage/sessions"
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :manage do
    root "homes#top"
    get 'search' => 'homes#search', as: 'search'
    get 'customers/:customer_id/orders' => 'orders#index', as: 'customer_orders'
    resources :admins, only: [:index, :edit, :update, :show]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :items
    resources :categories, only: [:index, :create, :edit, :update, :show]
  end

end
