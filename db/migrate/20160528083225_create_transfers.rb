class CreateTransfers < ActiveRecord::Migration
  def change
    create_table :transfers do |t|
      t.text :description
      t.string :from
      t.string :to
      t.date :date
      t.time :time
      t.integer :user_id
      t.integer :transfer_type, default: 0

      t.timestamps null: false
    end
  end
end
