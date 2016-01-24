class CreateBookKeepRecords < ActiveRecord::Migration
  def change
    create_table :book_keep_records do |t|
      t.string :name
      t.references :book_keep_category, index: true, foreign_key: true
      t.datetime :date
      t.integer :value
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
