class CreateJoinTableMembershipRole < ActiveRecord::Migration
  def change
    create_join_table :memberships, :roles do |t|
      # t.index [:membership_id, :role_id]
      # t.index [:role_id, :membership_id]
    end
  end
end
