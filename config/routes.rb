Rails.application.routes.draw do
  namespace :api do
    get "/products" => "products#index"
    get "/products_create" => "products#create"
    get "/products/:id" => "products#show"
    patch "/products/:id" => "products#update"
    delete "/products/:id" => "products#destroy"
  end
end
