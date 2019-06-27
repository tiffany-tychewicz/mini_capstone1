Rails.application.routes.draw do
  namespace :api do
    get "/products" => "products#index"
    get "/products_create" => "products#create"
    get "/products/:id" => "products#show"
    get "/segments/:name" => "products#segment"
  end
end
