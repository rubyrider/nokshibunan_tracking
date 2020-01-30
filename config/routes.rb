Rails.application.routes.draw do
  root 'welcome#index'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self) rescue ActiveAdmin::DatabaseHitDuringLoad

  devise_for :users, controllers: {
    sessions: 'users/sessions',
  }
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  resources :products
  resources :orders do
    collection do
      get :track
    end
  end
  resources :contact_admins
  get '/about' => 'contact_admins#about'
  resources :users do
    collection do
      get :check_order_user
    end
  end
end
