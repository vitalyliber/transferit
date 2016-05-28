class RenameTransferFields < ActiveRecord::Migration
  def change
    rename_column :transfers, :from, :from_id
    rename_column :transfers, :to, :to_id
    change_column :transfers, :from_id, :integer
    change_column :transfers, :to_id, :integer
  end
end
