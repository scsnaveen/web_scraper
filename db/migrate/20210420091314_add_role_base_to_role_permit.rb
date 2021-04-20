class AddRoleBaseToRolePermit < ActiveRecord::Migration[6.0]
  def change
  	add_column :role_permits,:role_base,:string
  end
end
