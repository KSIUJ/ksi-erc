class RemoveToFromPeriods < ActiveRecord::Migration
  def change
    remove_column :periods, :to, :date
  end
end
