class AddDoNotContactToMember < ActiveRecord::Migration[5.2]
  def change
    add_column :members, :do_not_contact, :boolean, default: false
  end
end
