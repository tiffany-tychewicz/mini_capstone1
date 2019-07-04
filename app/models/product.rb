class Product < ApplicationRecord
  validates :name, :price, :description, presence: true
  validates :description, length: { maximum: 1000, too_long: "%{count} characters is the maximum allowed" }

  def supplier
    Supplier.find_by(id: self.supplier_id)
  end
  
end
