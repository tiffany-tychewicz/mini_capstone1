class Product < ApplicationRecord
  validates :name, :price, :description, presence: true
  validates :description, length: { maximum: 1000, too_long: "%{count} characters is the maximum allowed" }

  # def supplier
  #   Supplier.find_by(id: self.supplier_id)
  # end
  
  # belongs_to :supplier
  has_many :orders
  has_many :category_products
  has_many :categories, through: :category_products
  has_many :carted_products



  # def categories
  #   category_products.map { |category_product| category_product.categories }
  # end

  def is_discounted?
    price <= 10
  end

  def tax
    price * 0.09
  end

  def total
    price + tax
  end

  # def image_url
  #   if images.length > 0
  #     images[0].url
  #   else
  #     "https://www.hutchinsontires.com/helpers/img/no_image.jpg"
  #   end
  # end

end
