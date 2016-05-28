class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :description
      t.integer :star
      t.integer :target_id
      t.integer :author_id

      t.timestamps null: false
    end
  end
end
