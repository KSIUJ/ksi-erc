class AddWhoSignedUpToMembership < ActiveRecord::Migration
  def change
    add_column :memberships, :who_signed_up, :integer
  end
end
