class BookKeepRecordChangeValueToFloat < ActiveRecord::Migration
  def change
  	change_table :book_keep_records do |t|
      t.change :value, :decimal
    end
  end
end
