Rails.application.routes.draw do
  get 'home/top'
  get 'homes/about'

  root to:'homes#top'
  devise_for :users
  resources :books

  resources :users, only: [:new, :create, :index, :show, :edit, :update]

end
