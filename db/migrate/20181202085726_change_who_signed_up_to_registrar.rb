class ChangeWhoSignedUpToRegistrar < ActiveRecord::Migration[5.2]
  def change
    rename_column :memberships, :who_signed_up, :registrar_id
  end
end
