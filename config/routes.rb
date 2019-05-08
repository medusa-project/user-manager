# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
Rails.application.routes.draw do
  root 'landing#index'
  match '/auth/:provider/callback', to: 'sessions#create', via: [:get, :post],
        as: 'auth' # used by omniauth

  resources :users, param: :username
end
