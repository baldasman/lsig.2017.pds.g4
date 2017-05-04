class CreateClients < ActiveRecord::Migration[5.0]
  def change
    create_table :clients do |t|
      t.string :name
      t.number :phone_number
      t.string :nib
      t.string :address
      t.timestamps
    end
  end
end
