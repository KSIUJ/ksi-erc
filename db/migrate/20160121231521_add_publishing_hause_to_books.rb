class AddPublishingHauseToBooks < ActiveRecord::Migration
  def change
    add_reference :books, :publishing_house, index: true, foreign_key: true
  end
end
