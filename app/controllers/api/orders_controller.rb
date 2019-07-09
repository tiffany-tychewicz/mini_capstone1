class Api::OrdersController < ApplicationController
  def create
    price = Product.find_by(id: params["product_id"])
    # Go to the products table, find the product with an id of params["product_id"], grab the price
    @create_order = Order.new(
      user_id: current_user.id,
      product_id: params["product_id"],
      quantity: params["quantity"],
      subtotal: price * params["quantity"],
      tax: price * params["quantity"].to_i * 0.09,
      total: price * params["quantity"].to_i + tax,
    )
    @order.save
    render "create_order.json.jb"
  end

end
