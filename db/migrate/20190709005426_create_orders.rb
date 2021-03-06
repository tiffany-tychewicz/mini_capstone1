class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.string :user_id
      t.integer :price
      t.string :product_id
      t.integer :quantity
      t.integer :subtotal
      t.integer :tax
      t.integer :total

      t.timestamps
    end
  end
end
