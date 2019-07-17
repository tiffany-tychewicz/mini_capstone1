class ProductsController < ApplicationController
  def index
    @products = Product.all
    render "index.html.erb"
  end

  def new
    render "new.html.erb"
  end

  def create
    render "new.html.erb"
    @create_product = Product.new(
      name: params[:input_name],
      price: params[:input_price],
      image_url: params[:new_image_url],
      description: params[:description]
      )
    @create_product.save
    redirect_to "/products"

  end

  def show
    @products = Product.find_by(id: params[:id])
    render "show.html.erb"
  end

  def edit
    @products = Product.find_by(id: params[:id])
    @user = User.all
    render "edit.html.erb"
  end

  d  def update
    @products = Product.find_by(id: params[:id])
    @products.name = params[:input_name
    @products.price = params[:input_price]
    @products.image_url = params[:input_image_url]
    @products.description = params[:input_description]
    @products.user_id = params[:user_id]
    @products.save
    redirect_to "/products"
  end

end
