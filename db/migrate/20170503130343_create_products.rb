class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.integer :quantity
      t.text :description
      t.string :brand
      t.integer :rating
      t.integer :category_id

      t.timestamps null: false
    end
  end
end
