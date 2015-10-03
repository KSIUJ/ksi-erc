class CreatePeriods < ActiveRecord::Migration
  def change
    create_table :periods do |t|
      t.date :from
      t.date :to
      t.decimal :fee

      t.timestamps null: false
    end
  end
end
