Rails.application.routes.draw do
  devise_for :users, path_names: { sign_in: 'login', sign_out: 'logout' }

  root 'static_pages#home'
  get '/about', to: 'static_pages#about'

  resources :users, only: [ :show ]
end
