# Exercise:
# • In your mini_capstone, create a single route that can display ANY single product using a query parameter.

# • In your mini_capstone, create a single route that can display ANY single product using a url segment parameter.

# (Hint: You can refer to your cheat sheet to find a way to get a specific product…)

class Api::ProductsController < ApplicationController
  def index
    @all_products = Product.all
    render "index.json.jb"
  end

  def create
    @product = Product.new(
      name: params["name"],
      price: params["price"],
      image_url: params["image_url"],
      description: params["description"])
    render "create.json.jb"
  end
end
