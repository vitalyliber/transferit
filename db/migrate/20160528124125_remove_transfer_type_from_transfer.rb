class RemoveTransferTypeFromTransfer < ActiveRecord::Migration
  def change
    remove_column :transfers, :transfer_type
  end
end
