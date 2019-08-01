class Api::CartedProductsController < ApplicationController
  before_action :authenticate_user

  def create
    @create_carted_product = CartedProduct.new(
    status: "carted",
    product_id: params["product_id"],
    quantity: params["quantity"],
    user_id: current_user.id,
    order_id: current_user.id
    )

    @create_carted_product.save
    render "show.json.jb"
  end

  def index
    @carted_products = CartedProduct.all
  end

end
