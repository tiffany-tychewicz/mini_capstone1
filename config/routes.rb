Rails.application.routes.draw do
  namespace :api do
    get "/products" => "products#index"
    get "/products_create" => "products#create"
  end
end
