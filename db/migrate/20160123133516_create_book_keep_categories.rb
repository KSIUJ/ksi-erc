class CreateBookKeepCategories < ActiveRecord::Migration
  def change
    create_table :book_keep_categories do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
