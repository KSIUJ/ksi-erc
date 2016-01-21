class AddPublishingHauseToBooks < ActiveRecord::Migration
  def change
    add_reference :books, :publishing_hause, index: true, foreign_key: true
  end
end
