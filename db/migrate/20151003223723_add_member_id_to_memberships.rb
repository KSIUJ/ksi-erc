class AddMemberIdToMemberships < ActiveRecord::Migration
  def change
    add_column :memberships, :member_id, :integer
  end
end
