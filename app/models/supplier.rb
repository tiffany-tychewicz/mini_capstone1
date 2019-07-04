class Supplier < ApplicationRecord

  def products
    Product.where(supplier_id: self.id)
  end

  def supplier
    Supplier.find_by(id: self.supplier_id)
  end

end
