class AddRangeToPeriods < ActiveRecord::Migration[5.2]
  def change
    add_column :periods, :begin, :date
    add_column :periods, :end, :date
  end
end
