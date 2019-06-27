class CreateModelNames < ActiveRecord::Migration[5.2]
  def change
    create_table :model_names do |t|
      t.string :attribute_1
      t.string :attribute_2
      t.string :attribute_3

      t.timestamps
    end
  end
end
