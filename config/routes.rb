Rails.application.routes.draw do
  resources :checked_out_books, only: [:create]
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'books/search', to: "books#search"
  resources :books, :libraries, only: [:index, :show]
end
