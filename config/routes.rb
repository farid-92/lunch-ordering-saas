Rails.application.routes.draw do
  root 'welcome#index'
  devise_for :users
  devise_for :admins, controllers: {
    sessions: 'admins/sessions',
    registrations: 'admins/registrations'
  }

  namespace :admin do
    root to: 'organizations#index'
    resources :organizations, except: :show
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
