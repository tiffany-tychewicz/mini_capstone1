class Api::ProductsController < ApplicationController
  def index
    @all_products = Product.all
    render "index.json.jb"
  end

  def create
    @create_product = Product.new(
      name: params["name"],
      price: params["price"],
      image_url: params["image_url"],
      description: params["description"])
    render "create.json.jb"
  end

  def show
    product_id = params["id"]
    @product = Product.find_by(id: product_id)
    render "show.json.jb"
  end
end