Rails.application.routes.draw do
  devise_for :admins

  namespace :admin do
    root to: 'organizations#index'
    resources :organizations, except: :show
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
