Rails.application.routes.draw do
  # get 'urls/index'
  # get 'urls/new'
  # get 'users/new'
  # get 'users/edit'
  # get 'users/show'
  # # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :urls, only: [:index, :create, :show]
  resources :users, only: [:index, :create, :show]
  get "/:url_id" => "urls#redirect"
  root "urls#index"
  # Defines the root path route ("/")
  # root "articles#index"
end
