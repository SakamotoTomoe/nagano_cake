Rails.application.routes.draw do
  namespace :admin do
    get 'orders/show'
  end
  namespace :admin do
    get 'customers/index'
    get 'customers/show'
    get 'customers/edit'
  end
  namespace :admin do
    get 'homes/top'
  end
  namespace :admin do
    resources :genres, only: [:index, :edit, :create, :update]
  end

  namespace :admin do
    resources :items, only: [:new, :index, :show, :edit]
  end
  namespace :admin do
    get 'sessions/new'
  end
  devise_for :admins
  devise_for :customers
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
