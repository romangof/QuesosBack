class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.string :description
      t.decimal :buyprice
      t.decimal :saleprice

      t.timestamps null: false
    end
  end
end
