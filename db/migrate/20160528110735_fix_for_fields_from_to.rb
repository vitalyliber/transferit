class FixForFieldsFromTo < ActiveRecord::Migration
  def change
    remove_column :transfers, :from_id
    add_column :transfers, :from_id, :integer, default: 0
    remove_column :transfers, :to_id
    add_column :transfers, :to_id, :integer, default: 0
  end
end
