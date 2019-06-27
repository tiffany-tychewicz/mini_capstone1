class Api::ProductsController < ApplicationController
  def all_products_method
    @all_products = Product.all
    render "all_product_info.json.jb"
  end
end
