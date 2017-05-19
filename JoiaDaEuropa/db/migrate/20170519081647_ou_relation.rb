class OuRelation < ActiveRecord::Migration[5.0]
  def change
    add_reference :orders, :upload
  end
end
