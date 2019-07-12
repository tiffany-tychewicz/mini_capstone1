class Api::OrdersController < ApplicationController
  
  def index
    @orders = current_user.orders
    render "index.json.jb"
  end


  def create
    # product = Product.find_by(id: params[:product_id])
    carted_product = CartedProduct.all(status: "carted")
    # Use that data to create a new row in the orders table, and save the user_id, subtotal, tax, and total.

    

    @create_carted_order = Order.new(
      user_id: params["user_id"],
      subtotal: product.subtotal,
      tax: product.tax,
      total: product.total,
      
      )
   
    # Go to the products table, find the product with an id of params["product_id"], grab the price

    calculated_subtotal = product.price * params[:quantity].to_i
    calculated_tax = product.tax * params[:quantity].to_i
    calculated_total = product.total * params[:quantity].to_i

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
