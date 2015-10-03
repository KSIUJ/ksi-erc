class CreateMemberships < ActiveRecord::Migration
  def change
    create_table :memberships do |t|
      t.boolean :fee_paid
      t.boolean :tshirt

      t.timestamps null: false
    end
  end
end
