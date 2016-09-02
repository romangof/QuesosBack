class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.datetime :date
      t.string :status
      t.string :description
      t.references :customer, index: true, foreign_key: true, null: false

      t.timestamps null: false
    end
  end
end
