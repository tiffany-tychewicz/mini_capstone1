class CreateCategoryProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :category_products do |t|
      t.string :category_id
      t.string :product_id

      t.timestamps
    end
  end
end
