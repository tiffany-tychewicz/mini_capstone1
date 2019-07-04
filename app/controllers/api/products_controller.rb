# Exercise:


# • In your mini_capstone, create a single route that can display ANY single product using a url segment parameter.

# (Hint: You can refer to your cheat sheet to find a way to get a specific product…)

class Api::ProductsController < ApplicationController
  def index
    @products = Product.all

    if params[:search]
      @products = @products.where("name ILIKE ?", "%#{params[:search]}%")
    end

    if params[:discount] == "true"
      @products = @products.where("price < ?", 2)
    end

    if params[:sort] == "price" && params[:sort_order] == "asc"
      @products = @products.order(price: :asc)
    elsif params[:sort] == "price" && params[:sort_order] == "desc"
      @products = @products.order(price: :desc)
    else
      @products = @products.order(id: :asc)
    end
    
    render "index.json.jb"
      
  end

  def create
    @create_product = Product.new(
      name: params["name"],
      price: params["price"],
      image_url: params["image_url"],
      description: params["description"])

    if @create_product.save
      render "create.json.jb"
    else render json: { errors: @create_product.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def show
    product_id = params["id"]
    @product = Product.find_by(id: product_id)
    render "show.json.jb"
  end

  def update
    @product = Product.find_by(id: params["id"])
    @product.name = params["name"] || @product.name
    @product.price = params["price"] || @product.price
    @product.image_url = params["image_url"] || @product.image_url
    @product.description = params["description"] || @product.description
    if @product.save
      render "show.json.jb"
    else render json: { errors: @product.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @product = Product.find_by(id: params["id"])
    @product.destroy
    render json: {message: "Please press F."}
  end

  def show_supplier
    supplier_id = params["id"]
    @supplier = Supplier.find_by(id: supplier_id)
    render "supplier.json.jb"
  end


end
