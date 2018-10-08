Rails.application.routes.draw do
  # devise_for :users
  devise_for :users, controllers: { sessions: 'v1/users/sessions' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :v1 do
    resources :activities
    # resources :sessions, only: [:create, :destroy] 
  end


end
