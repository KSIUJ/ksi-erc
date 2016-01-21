class CreateBookLeases < ActiveRecord::Migration
  def change
    create_table :book_leases do |t|
      t.datetime :date_start
      t.datetime :date_end

      t.timestamps null: false
    end
  end
end
