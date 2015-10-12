class AddInfoToPeriods < ActiveRecord::Migration
  def change
    add_column :periods, :info, :string
  end
end
