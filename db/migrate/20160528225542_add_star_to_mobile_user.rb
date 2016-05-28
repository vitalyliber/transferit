class AddStarToMobileUser < ActiveRecord::Migration
  def change
    add_column :mobile_users, :star, :integer, default: 0
  end
end
