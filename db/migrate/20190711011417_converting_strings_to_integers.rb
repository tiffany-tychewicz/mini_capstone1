class ConvertingStringsToIntegers < ActiveRecord::Migration[5.2]
  def change
    change_column :category_products, :category_id, "numeric USING CAST(category_id AS numeric)"
    change_column :category_products, :category_id, :integer

    change_column :category_products, :product_id, "numeric USING CAST(product_id AS numeric)"
    change_column :category_products, :product_id, :integer
  end
end
