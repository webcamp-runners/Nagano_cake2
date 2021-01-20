Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :customers
  devise_for :admins



#顧客側ルート
  scope module: :customer do
    get "/" => "homes#top"
    get 'about'
    resources :cart_items, only: [:index, :create, :update, :destroy] do
      collection do
        delete 'destroy_all'
      end
    end
    resources :customers, only: [:show, :edit, :update] do
      collection do
        get 'unsubscribe'
        patch 'withdraw'
      end
    end
    resources :orders, only: [:new, :index, :create] do
      collection do
        get 'confirm'
        get 'complete'
        get "my_page" => "customers#"
      end
    end
    resources :addresses, except: [:new, :show]
  end

  resources :products, only: [:index, :show]

  #管理者側ルート
  namespace :admin do
    get "/" => "homes#top"
    resources :products, except: [:destroy]
    resources :genres, except: [:new, :show, :destroy]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :orders, only: [:index, :show, :update]
    resource :order_details, only: [:update]
  end

end
