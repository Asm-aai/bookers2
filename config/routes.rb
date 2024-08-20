Rails.application.routes.draw do
  resources :users, only: [:show, :index, :edit]
  get 'users/show'
  get 'users/edit'
  get 'users/index'
  resources :books, only: [:show, :index, :create, :destroy]
  devise_for :users
  root to: "homes#top"

  get "/homes/about" => "homes#about", as: 'about'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
