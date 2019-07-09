class Product < ApplicationRecord
  validates :name, :price, :description, presence: true
  validates :description, length: { maximum: 1000, too_long: "%{count} characters is the maximum allowed" }

  # def supplier
  #   Supplier.find_by(id: self.supplier_id)
  # end
  
  belongs_to :supplier
  has_many :orders

  def is_discounted?
    price <= 10
  end

  def tax
    price * 0.09
  end

  def total
    price + tax
  end

end
