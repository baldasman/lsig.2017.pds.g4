class AddRoleToUser < ActiveRecord::Migration[5.0]
  def change
    # por defeito ao fazer LogIn é considerado cliente
    add_column :users, :is_client, :boolean, default:true
  end
end
