class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.decimal :ammount, null: false
      t.datetime :date, null: false
      t.string :description
      t.references :customer, index: true, foreign_key: true, null: false

      t.timestamps null: false
    end
  end
end
