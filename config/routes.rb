Rails.application.routes.draw do
  root 'welcome#index'
  devise_for :admins
  devise_for :users

  namespace :admin do
    root to: 'organizations#index'
    resources :organizations, except: :show
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
