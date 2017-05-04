class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.string :description
      t.datetime :delivery_date
      t.decimal :unit_price
      t.integer :quantity
      t.decimal :total_price
      t.timestamps
    end
  end
end
