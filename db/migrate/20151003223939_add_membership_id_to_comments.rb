class AddMembershipIdToComments < ActiveRecord::Migration
  def change
    add_column :comments, :membership_id, :integer
  end
end
