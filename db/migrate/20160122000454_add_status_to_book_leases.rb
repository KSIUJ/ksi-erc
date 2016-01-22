class AddStatusToBookLeases < ActiveRecord::Migration
  def change
    add_column :book_leases, :active, :boolean
  end
end
