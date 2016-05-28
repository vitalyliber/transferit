class CreateMobileUsers < ActiveRecord::Migration
  def change
    create_table :mobile_users do |t|
      t.string :first_name
      t.string :last_name
      t.integer :phone, :limit => 8

      t.timestamps null: false
    end
  end
end
