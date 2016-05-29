class AddDateArrivalAndTimeArrivalToTransfer < ActiveRecord::Migration
  def change
    add_column :transfers, :date_arrival, :date
    add_column :transfers, :time_arrival, :time
  end
end
