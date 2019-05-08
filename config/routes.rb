# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
Rails.application.routes.draw do
  match '/auth/:provider/callback', to: 'sessions#create', via: [:get, :post],
        as: 'auth' # used by omniauth

  resources :users, param: :username

  match '/', to: 'users#index', via: :all, as: 'root'
  match '/', to: redirect('/users'), via: :all
end
