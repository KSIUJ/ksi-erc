class AddPeriodIdToMemberships < ActiveRecord::Migration
  def change
    add_column :memberships, :period_id, :integer
  end
end
