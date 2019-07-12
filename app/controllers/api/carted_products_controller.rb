class Api::CartedProductsController < ApplicationController

  def create
    @create_carted_products = CartedProduct.new(
    status: carted_product.status,
    product_id: params["product_id"],
    quantity: params["quantity"],
    user_id: carted_product.user_id,
    order_id: carted_product.order_id
    )
    @create_order.save
    render "create_order.json.jb"
    
  end
end
