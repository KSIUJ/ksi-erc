class AddBorrowerToBookLeases < ActiveRecord::Migration
  def change
    add_reference :book_leases, :member, index: true, foreign_key: true
  end
end
