class RemoveRoleIdFromMemberhip < ActiveRecord::Migration
  def change
    remove_column :memberhips, :role_id, :integer
  end
end
