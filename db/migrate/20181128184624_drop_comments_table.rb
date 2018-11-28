class DropCommentsTable < ActiveRecord::Migration[5.2]
  def change
    drop_table :comments do |t|
      t.string   "text"
      t.datetime "created_at",    null: false
      t.datetime "updated_at",    null: false
      t.integer  "membership_id"  
    end
  end
end
