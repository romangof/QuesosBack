class CreateOrderDetails < ActiveRecord::Migration
  def change
    create_table :order_details do |t|
      t.references :order, index: true, foreign_key: true, null: false
      t.references :product, index: true, foreign_key: true, null: false
      t.integer :quantity, null: false
      t.decimal :priceEach

      t.timestamps null: false
    end
  end
end
