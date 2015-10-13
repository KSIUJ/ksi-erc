class RemoveRoleIdFromMembership < ActiveRecord::Migration
  def change
    remove_column :memberships, :role_id, :integer
  end
end
