Rails.application.routes.draw do

  get 'users/index'
  get 'users/show'
  get 'users/edit'
  devise_for :users
  root to: "homes#top"
  get 'homes/about'=>'homes#about'
  resources :books, only:[:index,:show,:new,:edit,:destroy,:create]
  resources :users, only: [:show, :edit]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
