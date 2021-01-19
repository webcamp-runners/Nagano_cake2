Rails.application.routes.draw do
  devise_for :customers
  devise_for :admins
  
  namespace :admin do
    get "home" => "homes#top"
  end
  
  scope module: :customer do
    get "home" => "homes#top"
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
