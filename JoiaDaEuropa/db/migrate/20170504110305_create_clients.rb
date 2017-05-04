class CreateClients < ActiveRecord::Migration[5.0]
  def change
    #Criação tabela clientes
    create_table :clients do |t|
      t.string :name
      t.string :phone_number
      t.string :nib
      t.text :address
      t.timestamps
    end
  end



end
