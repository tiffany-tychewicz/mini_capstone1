class AddingSupplierId < ActiveRecord::Migration[5.2]
  def change
    add_column :product, :supplier_id, :integer
  end
end
