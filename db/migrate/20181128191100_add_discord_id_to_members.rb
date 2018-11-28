class AddDiscordIdToMembers < ActiveRecord::Migration[5.2]
  def change
    add_column :members, :discord_id, :string, unique: true
  end
end
