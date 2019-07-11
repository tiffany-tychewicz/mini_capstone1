class Api::OrdersController < ApplicationController
  
  def index
    @orders = current_user.orders
    render "index.json.jb"
  end


  def create
    product = Product.find_by(id: params[:product_id])
    calculated_subtotal = product.price * params[:quantity].to_i
    calculated_tax = product.tax * params[:quantity].to_i
    calculated_total = product.total * params[:quantity].to_i
    # Go to the products table, find the product with an id of params["product_id"], grab the price
    @create_order = Order.new(
      user_id: current_user.id,
      product_id: params[:product_id],
      quantity: params[:quantity],
      subtotal: calculated_subtotal,
      tax: calculated_tax,
      total: calculated_total,
      price: product.price,
    )
    @create_order.save
    render "create_order.json.jb"
  end

  def show
    @order = current_user.orders.find_by(id: params[:id])
    render "show.json.jb"
  end

end
