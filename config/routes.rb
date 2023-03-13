Rails.application.routes.draw do

  scope module: :public do
    resources :address, only: [:index, :edit, :create, :update, :destroy]
  end

  scope module: :public do
    resources :orders, only: [:new, :index, :show, :create]
    post 'orders/confirm' => 'orders#confirm', as: :orders_confirm
    get 'orders/complete' => 'orders#complete', as: :orders_complete
  end

  scope module: :public do
    resources :cart_items, only: [:index, :update, :destroy, :create]
    delete 'cart_items' => 'cart_items#all_destroy', as: :cart_items_all_destroy
  end

  scope module: :public do
    get 'customers/my_page' => 'customers#show'
    get 'customers/my_page/edit' => 'customers#edit'
    patch 'customers/my_page' => 'customers#update'
    get 'customers/confirm' => 'customers#confirm'
    patch 'customers/my_page/cancel' => 'customers#cancel'
  end

  scope module: :public do
    resources :items, only: [:index, :show]
  end

  scope module: :public do
    root to: "homes#top"
    get '/about' => 'homes#about'
  end

  namespace :admin do
    get 'orders/show'
  end
  namespace :admin do
    resources :customers, only: [:index, :show, :edit, :update]
  end
  namespace :admin do
    root to: "homes#top"
  end
  namespace :admin do
    resources :genres, only: [:index, :edit, :create, :update]
  end

  namespace :admin do
    resources :items, only: [:new, :index, :show, :edit, :create, :update]
  end
  namespace :admin do
    get 'sessions/new'
  end
  #devise_for :admins
  #devise_for :customers
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

# 顧客用
# URL /customers/sign_in ...
devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

# 管理者用
# URL /admin/sign_in ...
devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}

end
