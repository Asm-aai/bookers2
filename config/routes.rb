Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show, :index, :edit, :update]
  resources :books, only: [:show, :index, :create, :destroy, :edit]
  root to: "homes#top"

  get "/home/about" => "homes#about", as: 'about'
  post 'books' => 'books#create'
  patch "/books/:id" => "books#update", as: 'update_book'
  delete "/books/:id" => "books#destroy"
  patch "/users/:id" => "users#update", as: "update_user"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
