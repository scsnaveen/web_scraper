class CreateRolePermits < ActiveRecord::Migration[6.0]
  def change
    create_table :role_permits do |t|
    	t.string :role_limit

      t.timestamps
    end
  end
end
