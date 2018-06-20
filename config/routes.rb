Rails.application.routes.draw do
  root 'application#hello'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  post '/logout', to: 'sessions#destroy'
  get '/request-form', to: 'requests#request_form'
  post '/request-form', to: 'requests#search'
  get "/requests/new", to: "requests#new"
  post "/requests", to: "requests#create"
  post "/approve-request", to: "book_copies#create"
  resources :checked_out_books, only: [:create,:update]
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'books/search', to: "books#search"
  resources :books, :libraries, only: [:index, :show]
end
