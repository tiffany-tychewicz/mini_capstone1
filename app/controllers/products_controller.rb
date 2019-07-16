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

end
