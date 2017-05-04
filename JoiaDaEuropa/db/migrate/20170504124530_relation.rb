class Relation < ActiveRecord::Migration[5.0]
  def change
    add_reference :orders, :state
    add_reference :orders, :client
    add_reference :clients, :user

  end
end
