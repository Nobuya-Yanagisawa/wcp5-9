Rails.application.routes.draw do
  root 'root#home'
  get '/about' => 'root#about'

  devise_for :users

  resources :books

  resources :users, only: [:show, :index, :edit, :update]
end
