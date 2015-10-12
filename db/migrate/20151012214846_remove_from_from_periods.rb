class RemoveFromFromPeriods < ActiveRecord::Migration
  def change
    remove_column :periods, :from, :date
  end
end
