class AddBookToBookLeases < ActiveRecord::Migration
  def change
    add_reference :book_leases, :book, index: true, foreign_key: true
  end
end
