class CreateParcels < ActiveRecord::Migration
  def change
    create_table :parcels do |t|
      t.text :description
      t.date :date
      t.integer :user_id
      t.integer :from_id
      t.integer :to_id

      t.timestamps null: false
    end
  end
end
