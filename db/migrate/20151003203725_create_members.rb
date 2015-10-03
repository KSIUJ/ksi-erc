class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.string :name
      t.string :surname
      t.string :email
      t.string :card_id

      t.timestamps null: false
    end
  end
end
