Rails.application.routes.draw do
  root 'welcome#index'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self) rescue ActiveAdmin::DatabaseHitDuringLoad
  devise_for :users

  resources :products
  resources :orders do
    collection do
      get :track
    end
  end
  resources :contact_admins
  get '/about' => 'contact_admins#about'
end
