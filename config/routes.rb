Rails.application.routes.draw do
  get "/products" => "products#index"
  get "/products/new" => "products#new"
  get "/products/:id" => "products#show"
  post "/products" => "products#create"
  get "/products/:id/edit" => "products#edit"
  patch "/products/:id" => "products#update"


  namespace :api do
    get "/products" => "products#index"
    post "/products" => "products#create"
    get "/products/:id" => "products#show"
    patch "/products/:id" => "products#update"
    delete "/products/:id" => "products#destroy"
    post "/users" => "users#create"
    post "/sessions" => "sessions#create"
    post "/orders" => "orders#create"
    get "category_products" => "category_products#index"
    post "carted_products" => "carted_products#create"
    get "carted_products" => "carted_products#index"
  end
end
